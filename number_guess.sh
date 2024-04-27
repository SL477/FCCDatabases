#!/bin/bash
NUMBER=$((1 + RANDOM % 1000))
#PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
# echo $NUMBER

if [[ ! $1 ]]
  then
    echo Enter your username: 
    read USR
    until [ ${#USR} -le 22 ]
    do
      echo Enter your username: 
      read USR
    done
    USERNAME=$USR
else
  USERNAME=$1
fi

# now that we have the username we need to see if they exist in the database, get total games and their best game
# if they don't exist insert them and then get their user ID

USER_RESULT=$($PSQL "SELECT COUNT(g.game_id) AS totalGames, MIN(g.num_guesses) AS bestgame FROM users u LEFT JOIN games g USING(user_id) WHERE u.name='$USERNAME' HAVING COUNT(g.game_id) > 0;")
USER_ID=0
if [[ -z $USER_RESULT ]]
then
  # need to insert the user
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME');")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # welcome the user
  echo "$USER_RESULT" | while read TOTALGAMES BAR BESTGAME
  do
    echo "Welcome back, $USERNAME! You have played $TOTALGAMES games, and your best game took $BESTGAME guesses."
  done
fi

USERID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME';")

# Start guessing the numbers
echo Guess the secret number between 1 and 1000:
read GUESS
NUMGUESSES=1
until [ $GUESS = $NUMBER ]
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again: "
  else
    if [[ $GUESS -gt $NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
  fi
  read GUESS
  (( NUMGUESSES++ ))
done

# Insert into games
GAME_RESULT=$($PSQL "INSERT INTO games(user_id, num_guesses) VALUES($USERID, $NUMGUESSES);")

echo "You guessed it in $NUMGUESSES tries. The secret number was $NUMBER. Nice job!"

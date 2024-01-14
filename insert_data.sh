#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Reset tables
echo $($PSQL "TRUNCATE TABLE games, teams;")

declare -A teams

cat games.csv | while IFS="," read year round winner opponent g h
do
  if [[ $winner != winner ]] ; then
    #echo "$winner, $opponent"
    # check if winner in array
    if ! [[ -v teams[$winner] ]] ; then
      # insert into DB
      echo $($PSQL "INSERT INTO teams(name) VALUES('$winner');")
      teams[$winner]=$($PSQL "SELECT team_id FROM teams WHERE name = '$winner';")
    fi

    # Check if oppenent in array
    if ! [[ -v teams[$opponent] ]] ; then
      echo $($PSQL "INSERT INTO teams(name) VALUES('$opponent');")
      teams[$opponent]=$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent';")
    fi
    # echo "$g and $h and ${teams[$winner]} and "
    # insert the data into games
    echo $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($year, '$round', ${teams[$winner]}, ${teams[$opponent]}, $g, $h);")
  fi
done

# # loop through the keys
# for team in "${!teams[@]}" ; do
#   echo "key: $team, value: ${teams[$team]}"
# done

# echo test
# echo "${#teams[@]}"
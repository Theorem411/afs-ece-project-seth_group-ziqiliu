import os
import pandas as pd
import subprocess

def runTest():
    files = os.listdir(".")

    json_files = [ f for f in files if f.endswith('json') ]

    data_file = []
    for file in json_files:
        with open(file, 'r') as f: 
            # Load JSON data into a Series
            data_series = pd.read_json(f, typ='series')

            # Convert the Series to a DataFrame
            data_df = pd.DataFrame([data_series])

            # Add the filename as a new column
            data_df.insert(0, 'filename', file[:-5])

            # Append this DataFrame to the list
            data_file.append(data_df)

    df = pd.concat(data_file, ignore_index=True)

    print(df)

    # write df as .csv
    df.to_csv("cilk5.csv", index=False)

if __name__ == "__main__":
    runTest()
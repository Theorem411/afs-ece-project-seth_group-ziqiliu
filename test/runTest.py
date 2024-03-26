import os
import pandas as pd

def runTest():
    files = os.listdir()

    json_files = [ f for f in files if f.endswith('json') ]

    data_file = []
    for (file in json_files):
        with open(file, 'r')  as f: 
            data = pd.read_json(f)
            data_flat = pd.json_normalize(data)
            data_flat['filename'] = file[:-5]
            data_file.append(data_flat)

    df = pd.concat(data_file, ignore_index=True)
    return df

if __name__ == "__main__":
    df = runTest()
    print(df)
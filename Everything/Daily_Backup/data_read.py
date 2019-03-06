import pandas as pd


def main():
  """Run main function."""
  for i in range(0, 2):
    infile = "dximag.01.060{}.vasp".format(i)
    df = pd.read_csv(infile, sep="\s+")

    print("df = {}".format(df))


if __name__ == "__main__":
  main()

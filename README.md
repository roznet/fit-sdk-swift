# Fit File Parsing for swift

This code provide basic example of parsing Fit Files in swift using [FitFileParser Swift Package](https://github.com/roznet/FitFileParser)

It uses the official [Fit SDK](https://developer.garmin.com/fit)

It contains a few examples that show how to use the [swift package](https://github.com/roznet/FitFileParser):

- a small command line example to parse a file.
- a small iOS app that will open sample fit file and count the records
- a small macOS app that will open a sample fit file and count the records

You can also see an example of integration into the MacOS and iOS apps [FitFileExplorer and ConnectStats](https://github.com/roznet/connectstats).

The open source app [FitFileExplorer](https://itunes.apple.com/us/app/fit-file-explorer/id1244431640?ls=1&mt=12) that uses this library can be especially helpful in exploring the structure of a fit files while working with the package.

## Approach

It takes the example c code from the official SDK and integrate it into swift to generate a native object with an array of messages made of native swift dictionaries.

All the keys and fields are generated from the c structure that are parsed in `fit_convert.c` from the example SDK. The file `fit_example.h` contains all the definition and a script fitconv.py parses that and automatically generate the swift code to build the native swift structures.

## Why implement this Library?

The main purpose of this library was speed of parsing the fit file for the ConnectStats use case. It is not the most elegant or the most flexible.

This library was built to replace the original cpp code from the SDK used in ConnectStats and FitFileExplorer. As ConnectStats now [receives the FIT files](https://github.com/roznet/connectstats_server) from Garmin, the files are parsed live on the phone as they are received and performance was therefore important for the user experience. 

The cpp parsing ended up very slow, and it made fit file parsing on [ConnectStats or FitFileExplorer](https://github.com/roznet/connecstats) quite slow. This approach in c/swift is much faster.

You can check the [benchmarking of the library](https://github.com/roznet/fit-benchmarks) versus a few others.


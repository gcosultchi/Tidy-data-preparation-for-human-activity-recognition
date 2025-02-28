
# CodeBook

## Introduction
This codebook describes the variables and transformations performed on the human activity recognition dataset using Samsung Galaxy S phone accelerometers.

## Original Variables
The original dataset includes several variables representing accelerometer and gyroscope signals. The most relevant variables are those containing mean and standard deviation measurements.

## Transformations Performed
The following transformations were performed on the original dataset:

- **Dataset Combination**: Training and test datasets were combined to create a single dataset.
- **Extraction of Relevant Measurements**: Only columns containing mean and standard deviation measurements were extracted.
- **Use of Descriptive Activity Names**: Numerical activity codes were replaced with descriptive names (for example, "walking", "climbing stairs").
- **Descriptive Variable Labeling**: Variables were renamed to be more descriptive and easier to understand.
- **Creation of a Tidy Dataset with Averages**: A second dataset was created containing the average of each variable for each activity and subject.

## Variables in the Tidy Dataset
The final tidy dataset includes the following variables:

- **activity**: Descriptive name of the activity performed (for example, "walking", "climbing stairs").
- **subject**: Identifier of the subject who performed the activity.
- **Mean and Standard Deviation Variables**: Average measurements of mean and standard deviation for different accelerometer signals.

## Example Variables
Below is an example of some of the variables included in the tidy dataset:

- `tBodyAcc-mean()-X`
- `tBodyAcc-std()-Y`
- `tGravityAcc-mean()-Z`
- `tBodyGyro-mean()-X`
- `tBodyGyro-std()-Y`

These variables represent average measurements of mean and standard deviation for different components of accelerometer and gyroscope signals.

## Additional Notes
The original dataset was obtained from [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
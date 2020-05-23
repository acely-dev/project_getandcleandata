# CodeBook

## Tidy Dataset from UCI HAR
This new dataset containt:
* 180 observation
* 4 variables

### subject variable
- description: Anonymized identifier of the measurement user
- type: Numeric
- range: [1:30]

### activity variable
- description: Monitored activity
- type: Factor
- range: [1:"WALKING", 2:"WALKING_UPSTAIRS", 3:"WALKING_DOWNSTAIRS", 4:"SITTING", 5:"STANDING",6:"LAYING"]

### mean_activity variable
- description: average of activities measures group by subject and activity
- type: Numeric
- range: [-0.65025,-0.07831]

### sd_activity variable
- description: standar deviation of activities measures group by subject and activity
- type: Numeric
- range: [0.004506,0.030726]

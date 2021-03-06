# Scout Project
FRC scouting client app (Scout) and data visualization and analysis app (Scout Insights) created for the 2022 season.

## Overview
### Scout
The Scout app can be used on Android and iOs tablets and phones to gather match data. Once the data for a match is gathered, it is sent into a QR code that can be scanned from the Scout Insights app.

![Screen Shot 2022-04-07 at 11 06 28 PM](https://user-images.githubusercontent.com/26767411/162355810-f790e47c-1ede-440a-aa28-16b11f22a082.png)
![Screen Shot 2022-04-07 at 11 06 33 PM](https://user-images.githubusercontent.com/26767411/162355821-34b0604f-9041-40d4-afb5-ec7548f06753.png)
![Screen Shot 2022-04-07 at 11 06 38 PM](https://user-images.githubusercontent.com/26767411/162355851-d432bae7-27d2-434a-b896-71837ec5583d.png)


### Scout Insights
The Scout Insights app can be used on an iPad or an iPhone. It is used to aggregate match data gathered on Scout and calculate and visualize statistics. Data is acquired by scanning the QR code generated by the Scout app.
![Screen Shot 2022-04-07 at 11 08 03 PM](https://user-images.githubusercontent.com/26767411/162355780-87701461-73dd-43b7-b8f1-ca6b79664fb7.png)

## TODO (in order of priority)
Scout Insights
1. add page for statistics (per robot / all robots combined)
2. order scouting sheets by match number
3. clean up SheetInfoView
4. add crash protection when bad qr code is detected
5. add cache

Scout
1. add validation on textfields (currently allowed to send sheet with no match number / team number which makes Scout Insights crash)
2. add cache

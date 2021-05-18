# raw_gnss

## Get Raw GNSS Data On Android

Since Android 7.0, Android exposed the GNSS APIs required to get raw data points opening up the location black box earlier.

raw_gnss allows you to easily fetch the GNSSMeasurementEvents and GNSSNavigationMessages via inbuilt streams.

### Example: Fetch GNSSMeasurementModels

        StreamBuilder<GnssMeasurementModel>(
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return CircularProgressIndicator();
            }
            
            return ListView.builder(itemBuilder: (context, position) {
              return ListTile(
                title: Text("Satellite: ${snapshot.data.measurements?[position]?.svid}"),
              );
            });
          },
          stream: RawGnss().gnssMeasurementEvents,
        ),

iOS does not yet expose raw location data, hence this plugin does not support iOS as of yet.
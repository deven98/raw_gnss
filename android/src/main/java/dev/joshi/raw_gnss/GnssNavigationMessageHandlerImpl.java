package dev.joshi.raw_gnss;

import android.location.GnssMeasurement;
import android.location.GnssMeasurementsEvent;
import android.location.GnssNavigationMessage;
import android.location.LocationManager;
import android.os.Build;

import androidx.annotation.RequiresApi;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.EventChannel;

public class GnssNavigationMessageHandlerImpl implements EventChannel.StreamHandler {
    LocationManager locationManager;
    GnssNavigationMessage.Callback listener;

    GnssNavigationMessageHandlerImpl(LocationManager manager) {
        locationManager = manager;
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    @Override
    public void onListen(Object arguments, EventChannel.EventSink events) {
        listener = createSensorEventListener(events);
        locationManager.registerGnssNavigationMessageCallback(listener);
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    @Override
    public void onCancel(Object arguments) {
        locationManager.registerGnssNavigationMessageCallback(listener);
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    GnssNavigationMessage.Callback createSensorEventListener(final EventChannel.EventSink events) {
        return new GnssNavigationMessage.Callback() {
            @Override
            public void onGnssNavigationMessageReceived(GnssNavigationMessage event) {
                super.onGnssNavigationMessageReceived(event);
                HashMap<String, Object> resultMap = new HashMap<>();
                resultMap.put("data", event.getData());
                resultMap.put("contents", event.describeContents());
                resultMap.put("messageId", event.getMessageId());
                resultMap.put("status", event.getStatus());
                resultMap.put("subMessageId", event.getSubmessageId());
                resultMap.put("svid", event.getSvid());
                resultMap.put("type", event.getType());
                events.success(resultMap);
            }

            @Override
            public void onStatusChanged(int status) {
                super.onStatusChanged(status);
            }
        };
    }
}

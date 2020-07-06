package dev.joshi.raw_gnss;

import android.location.GnssMeasurement;
import android.location.GnssMeasurementsEvent;
import android.location.GnssNavigationMessage;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;

import androidx.annotation.RequiresApi;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.EventChannel;

public class GnssNavigationMessageHandlerImpl implements EventChannel.StreamHandler {
    LocationManager locationManager;
    GnssNavigationMessage.Callback listener;
    private Handler uiThreadHandler = new Handler(Looper.getMainLooper());
    LocationListener locationListener = new LocationListener() {
        @Override
        public void onLocationChanged(Location location) {

        }

        @Override
        public void onStatusChanged(String s, int i, Bundle bundle) {

        }

        @Override
        public void onProviderEnabled(String s) {

        }

        @Override
        public void onProviderDisabled(String s) {

        }
    };

    GnssNavigationMessageHandlerImpl(LocationManager manager) {
        locationManager = manager;
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    @Override
    public void onListen(Object arguments, EventChannel.EventSink events) {
        listener = createSensorEventListener(events);
        locationManager.registerGnssNavigationMessageCallback(listener);
        locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 0, 0.0f, locationListener);
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    @Override
    public void onCancel(Object arguments) {
        locationManager.unregisterGnssNavigationMessageCallback(listener);
        locationManager.removeUpdates(locationListener);
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

                uiThreadHandler.post(() -> events.success(resultMap));
            }

            @Override
            public void onStatusChanged(int status) {
                super.onStatusChanged(status);
            }
        };
    }
}

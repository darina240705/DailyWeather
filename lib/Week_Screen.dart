import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WeekScreen extends StatefulWidget {
    const WeekScreen([super.key]);

    @override
    State<WeekScreen> createState() => _WeekScreenState();
}

class _WeekScreenState extends State<WeekScreen> {
    // variables
    Map<String, dynamic>? data;
    List<dynamic>? dailyTemperatures;
    List<dynamic>? dailyDates;
    List<dynamic>? dailyWeatherCodes;

    @override
    void initState() {
        super.initState();
        fetchData();
    }

    // fetchData function to make HTTP GET request to the provided API
    void fetchData() async {
        //Convert URL string to Uni object
        Uri url = Uri.parse(
            'https://api.open-meteo.com/v1/forecast?latitude=49.18&longitude=74.18&daily=temperature_2m_max,weathercode');
        final response = await http.get(url);
        if (response.statusCode == 200) {
            setState(() {
                data = jsonDecode(response.body);
                dailyTemperatures = data!['daily']['temperature_2m_max'];
                dailyDates = data!['daily']['time'];
                dailyWeatherCodes = data!['daily']['weathercode'];
            });
        } else {
            // Handle error
            print('Error: ${response.statusCode}');
        }
    }

    // Weather condition variables using switch satetments
    String getWeatherDescription(int weatherCode) {
        switch (weatherCode) {
            case 0:
                return 'Clear';
            case 1:
            case 2:
            case 3:
                return 'Partly Cloudy';
            case 45:
            case 48:
                return 'Fog';
            case 51:
            case 53:
            case 55:
                return 'Drizzle';
            case 56:
            case 57:
                return 'Freezing Drizzle';
            case 61:
            case 63:
            case 65:
                return 'Rain';
            case 66:
            case 67:
                return 'Freezing Rain';
            case 71:
            case 73:
            case 75:
                return 'Snow';
            case 77:
                return 'Snow Grains';
            case 80:
            case 81:
            case 82:
                return 'Showers';
            case 85:
            case 86:
                return 'Snow Showers';
            case 95:
                return 'Thunderstorm';
            case 96:
            case 99:
                return 'Thunderstorm with Hail';
            default:
                return 'Unknown';
        }
    }
}
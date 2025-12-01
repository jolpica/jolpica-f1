# F1 Visualization Tool

An easy-to-use web-based tool for creating interactive graphs, charts, and visualizations using Formula 1 data from the jolpica-f1 API.

## Overview

The F1 Visualization Tool provides a user-friendly interface for anyone to create stunning visualizations of Formula 1 data without writing any code. It includes:

- 📊 **Interactive Dashboard** - Pre-built visualizations for quick insights
- 🎨 **Chart Builder** - Custom chart creation with full control
- 📈 **Multiple Chart Types** - Bar, line, pie, and radar charts
- 💾 **Export Functionality** - Download charts as PNG images
- 🏎️ **Rich F1 Data** - Access to seasons, drivers, teams, lap times, and more

## Quick Start

### Access the Tool

1. Start the Django development server
2. Navigate to `http://localhost:8000/visualizations/` for the dashboard
3. Or visit `http://localhost:8000/visualizations/builder/` for the chart builder

### Using the Dashboard

The dashboard provides instant access to championship standings:

1. Select a season year (2015-2024)
2. Click "Load Data" to view:
   - Driver championship standings (top 10)
   - Constructor championship standings
   - Quick stats about the season leader

### Using the Chart Builder

Create custom visualizations in 4 easy steps:

1. **Choose Chart Type**: Bar, Line, Pie, or Radar
2. **Select Visualization**: Pick what you want to visualize
   - Season Standings
   - Driver Comparison
   - Team Performance
   - Lap Times
3. **Configure Options**: Set years, drivers, teams, etc.
4. **Generate & Export**: Click "Generate Chart" and optionally export as PNG

## Available Visualizations

### 1. Season Standings

View driver or constructor championship standings for a specific year.

**Options:**
- Championship Type: Driver or Constructor
- Year: Any season from 2015-2024

**Example:**
- Chart Type: Bar
- Visualization: Season Standings
- Championship: Driver
- Year: 2024

### 2. Driver Comparison

Compare multiple drivers' championship points across multiple seasons.

**Options:**
- Drivers: Enter API IDs (e.g., `hamilton, verstappen, leclerc`)
- Start Year: Beginning of comparison range
- End Year: End of comparison range

**Example:**
- Chart Type: Line
- Visualization: Driver Comparison
- Drivers: `hamilton, verstappen, leclerc`
- Years: 2020-2024

**Popular Driver API IDs:**
- `hamilton` - Lewis Hamilton
- `verstappen` - Max Verstappen
- `leclerc` - Charles Leclerc
- `sainz` - Carlos Sainz
- `russell` - George Russell
- `norris` - Lando Norris
- `piastri` - Oscar Piastri
- `alonso` - Fernando Alonso
- `perez` - Sergio Pérez
- `gasly` - Pierre Gasly

### 3. Team Performance

Track a team's championship performance over multiple years.

**Options:**
- Team: Enter API ID (e.g., `red_bull, ferrari, mercedes`)
- Start Year: Beginning of analysis
- End Year: End of analysis

**Example:**
- Chart Type: Line
- Visualization: Team Performance
- Team: `red_bull`
- Years: 2020-2024

**Popular Team API IDs:**
- `red_bull` - Red Bull Racing
- `ferrari` - Scuderia Ferrari
- `mercedes` - Mercedes-AMG
- `mclaren` - McLaren F1 Team
- `alpine` - Alpine F1 Team
- `aston_martin` - Aston Martin F1 Team
- `alfa` - Alfa Romeo
- `haas` - Haas F1 Team
- `alphatauri` - AlphaTauri

### 4. Lap Time Comparison

Compare lap times between drivers in a specific race.

**Options:**
- Year: Season year
- Round: Round number (1-24)
- Drivers: Enter API IDs of drivers to compare

**Example:**
- Chart Type: Line
- Visualization: Lap Times
- Year: 2024
- Round: 1
- Drivers: `verstappen, hamilton, leclerc`

## API Endpoints

The visualization tool exposes several API endpoints for programmatic access:

### Chart Data Endpoint

```
GET /visualizations/api/chart-data/
```

Generic endpoint that returns chart-ready data based on query parameters.

**Parameters:**
- `type`: Type of visualization (`season_standings`, `driver_comparison`, `team_performance`, `lap_times`)
- Additional parameters based on type (see below)

**Season Standings:**
```
GET /visualizations/api/chart-data/?type=season_standings&year=2024&championship=driver
```

**Driver Comparison:**
```
GET /visualizations/api/chart-data/?type=driver_comparison&start_year=2020&end_year=2024&drivers[]=hamilton&drivers[]=verstappen
```

**Team Performance:**
```
GET /visualizations/api/chart-data/?type=team_performance&team=red_bull&start_year=2020&end_year=2024
```

**Lap Times:**
```
GET /visualizations/api/chart-data/?type=lap_times&year=2024&round=1&drivers[]=verstappen&drivers[]=hamilton
```

### Season Standings

```
GET /visualizations/api/standings/{year}/
```

Returns driver and team championship standings for a specific season.

**Response:**
```json
{
  "year": 2024,
  "drivers": [
    {
      "position": 1,
      "driver": "Max Verstappen",
      "driver_id": "verstappen",
      "points": 575.0,
      "wins": 19
    }
  ],
  "teams": [
    {
      "position": 1,
      "team": "Red Bull Racing",
      "team_id": "red_bull",
      "points": 860.0,
      "wins": 21
    }
  ]
}
```

### Driver Comparison

```
GET /visualizations/api/driver-comparison/?drivers[]=hamilton&drivers[]=verstappen
```

Returns comparison statistics for selected drivers.

**Response:**
```json
{
  "drivers": [
    {
      "driver": "Lewis Hamilton",
      "driver_id": "hamilton",
      "total_races": 334,
      "wins": 103,
      "podiums": 197,
      "total_points": 4632.5,
      "championships": 7,
      "win_rate": 30.84
    }
  ]
}
```

### Team Performance

```
GET /visualizations/api/team-performance/{team_id}/
```

Returns performance metrics for a specific team across all seasons.

**Response:**
```json
{
  "team": "Red Bull Racing",
  "team_id": "red_bull",
  "performance": [
    {
      "year": 2024,
      "position": 1,
      "points": 860.0,
      "wins": 21
    }
  ]
}
```

### Lap Time Comparison

```
GET /visualizations/api/lap-times/?year=2024&round=1&drivers[]=verstappen&drivers[]=hamilton
```

Returns detailed lap time data for comparison.

**Response:**
```json
{
  "race": {
    "year": 2024,
    "round": 1,
    "name": "Bahrain Grand Prix",
    "circuit": "Bahrain International Circuit"
  },
  "drivers": [
    {
      "driver": "Max Verstappen",
      "driver_id": "verstappen",
      "laps": [
        {"lap": 1, "time": 95.123, "average_speed": 212.5}
      ],
      "fastest_lap": 91.437,
      "average_lap": 93.821,
      "total_laps": 57
    }
  ]
}
```

## Chart Types

### Bar Chart
- Best for: Comparing values across categories
- Use cases: Season standings, driver wins, team points

### Line Chart
- Best for: Showing trends over time
- Use cases: Driver points progression, team performance evolution, lap times

### Pie Chart
- Best for: Showing proportions
- Use cases: Points distribution, win percentages

### Radar Chart
- Best for: Multi-dimensional comparisons
- Use cases: Driver statistics, team metrics

## Export Features

### PNG Export
Click the "Export as PNG" button to download your chart as a high-quality PNG image, perfect for:
- Presentations
- Reports
- Social media sharing
- Documentation

## Technical Details

### Frontend Technology
- **Chart.js 4.4.0**: Modern, responsive charting library
- **Tailwind CSS**: Utility-first CSS framework for styling
- **Vanilla JavaScript**: No build step required, works everywhere

### Backend Technology
- **Django 5.2**: Web framework
- **Django REST Framework**: API endpoints
- **PostgreSQL**: Data storage

### Data Sources
All data comes from the jolpica-f1 database, including:
- Championship standings (managed views)
- Session entries (race results)
- Lap times and pit stops
- Driver and team information

## Browser Support

The visualization tool works in all modern browsers:
- Chrome/Edge 90+
- Firefox 88+
- Safari 14+
- Opera 76+

## Tips & Best Practices

1. **Performance**: Limit lap time comparisons to 5 drivers or fewer for better chart readability
2. **Data Availability**: Some historical data (pre-2018) may have limited lap time information
3. **Chart Selection**: Use line charts for time series, bar charts for comparisons
4. **Export Quality**: Charts export at the displayed size - maximize your browser window for higher resolution exports

## Troubleshooting

### Chart not loading?
- Check your internet connection (Chart.js loads from CDN)
- Verify the year/round/driver/team IDs are correct
- Open browser console (F12) to see error messages

### No data returned?
- Ensure the selected year has data in the database
- Check that driver/team API IDs are correct (case-sensitive)
- Some rounds may not have lap time data available

### Export not working?
- Ensure the chart has been generated first
- Try a different browser if issues persist
- Check that JavaScript is enabled

## Future Enhancements

Potential additions to the tool:
- PDF export with multiple charts
- Save/load chart configurations
- More visualization types (scatter plots, heatmaps)
- Race-by-race progression charts
- Qualifying performance analysis
- Pit stop strategy visualizations
- Interactive filtering and drill-down
- Sharing charts via URL

## Contributing

To add new visualizations:

1. Create a new API endpoint in `jolpica_api/f1_visualizations/views/api_views.py`
2. Add the endpoint to `jolpica_api/f1_visualizations/urls.py`
3. Update the frontend to consume the new endpoint
4. Document the new visualization in this file

## Support

For issues or questions:
- Check the main jolpica-f1 documentation
- Review API endpoint responses in the browser console
- Refer to Chart.js documentation for chart customization

## License

Part of the jolpica-f1 project. See main repository LICENSE file.

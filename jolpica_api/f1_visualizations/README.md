# F1 Visualization Tool

Easy-to-use web interface for creating F1 data visualizations.

## Quick Start

1. Access the dashboard: `/visualizations/`
2. Use the chart builder: `/visualizations/builder/`

## Features

- 📊 Interactive charts (bar, line, pie, radar)
- 🏎️ Season standings
- 📈 Driver & team comparisons
- ⏱️ Lap time analysis
- 💾 PNG export

## API Endpoints

- `/visualizations/api/chart-data/` - Generic chart data
- `/visualizations/api/standings/{year}/` - Season standings
- `/visualizations/api/driver-comparison/` - Driver stats
- `/visualizations/api/team-performance/{team_id}/` - Team history
- `/visualizations/api/lap-times/` - Race lap times

## Full Documentation

See `/docs/VISUALIZATION_TOOL.md` for complete documentation.

## Structure

```
f1_visualizations/
├── views/
│   ├── ui_views.py      # Web page views
│   └── api_views.py     # JSON API endpoints
├── templates/
│   └── f1_visualizations/
│       ├── base.html           # Base template
│       ├── dashboard.html      # Main dashboard
│       └── chart_builder.html  # Chart builder
├── static/              # Static files (future)
└── urls.py             # URL routing
```

## Examples

### Dashboard
Visit `/visualizations/` to see pre-built championship standings.

### Custom Chart
1. Go to `/visualizations/builder/`
2. Select "Driver Comparison"
3. Enter drivers: `hamilton, verstappen, leclerc`
4. Set years: 2020-2024
5. Choose "Line" chart type
6. Click "Generate Chart"
7. Export as PNG

## Technology

- **Backend**: Django + DRF
- **Frontend**: Chart.js + Tailwind CSS
- **Data**: PostgreSQL (jolpica.formula_one models)

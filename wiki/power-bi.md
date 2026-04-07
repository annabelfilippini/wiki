---
title: Power BI
type: concept
created: 2026-04-06
updated: 2026-04-06
sources: []
tags: [data-analytics, tools]
missing_links: []
---

# Power BI

Course notes from UMich business analytics class. Covers the full Power BI workflow from data ingestion to visual storytelling.

## Power BI Ecosystem
- **Desktop** -- where most work happens
- **Service** -- cloud publishing
- **Mobile app** -- viewing

## Workflow
Extract data from sources -> build data model in Desktop -> explore data for trends -> create visualizations -> publish -> iterate

## Core Concepts

### ETL (Extract, Transform, Load)
The framework for getting data into Power BI. Power Query Editor handles transformation.

### Data Modeling
- **Fact vs. dimension tables**
- Primary and foreign keys
- **Cardinality:** one-to-one, many-to-many, many-to-one
- Cross-filter direction
- Active vs. inactive relationships
- Normalization -- breaking big tables into smaller ones

### DAX (Data Analysis Expressions)
- Customizes calculations beyond defaults
- **Calculated column** vs. **calculated measure**
- Functions: aggregation, text, date, time
- **Row context** (calculated columns) vs. **filter context** (dynamic, only visible when applied)
- **CALCULATE function** -- adds additional filter context (e.g., sales revenue for a specific location)

## Data Visualization Principles

### Chart Selection
- Histogram, bar, line, area, heat map, scatter, bubble -- know when to use each

### Gestalt Principles
Minimize cognitive load by eliminating redundant elements. 6 principles to know for visual perception.

### Preattentive Attributes
4 types that draw attention before conscious processing:
1. Color
2. Font
3. Spatial position (location on page)
4. Movement
5. Visual hierarchy (builds on all four)

### Data Storytelling
- **Big Idea:** express point of view, share what's at stake, must be a complete sentence
- **Narrative Arc:** plot -> rising action -> climax -> falling action -> resolution
- **Tension:** identify and build it
- **Narrative Flow:** the order you want the audience to experience the story (2 types)
- **Storyboarding:** visual outline before building

### Ethics
- Truncated Y-axis (misleading scale)
- Double Y-axis (confusing comparisons)

## Connections
- Data storytelling skills connect to [[wayloft]]'s approach to presenting rewards data

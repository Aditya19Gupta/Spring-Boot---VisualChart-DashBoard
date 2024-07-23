package com.adi.BlackCofferAssignment_VisualisationDashboard.model;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.persistence.Table;

@Entity
@lombok.Data
@Getter
@Setter
@ToString
@Table(name = "data")
public class Data {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;  // Assuming there's a primary key column, add one if not present

    @Column(name = "end_year")
    private Integer endYear;

    @Column(name = "citylng", columnDefinition = "TEXT")
    private String cityLng;

    @Column(name = "citylat", columnDefinition = "TEXT")
    private String cityLat;

    @Column(name = "intensity")
    private Integer intensity;

    @Column(name = "sector")
    private String sector;

    @Column(name = "topic")
    private String topic;

    @Column(name = "insight")
    private String insight;

    @Column(name = "swot")
    private String swot;

    @Column(name = "url")
    private String url;

    @Column(name = "region")
    private String region;

    @Column(name = "start_year")
    private String startYear;

    @Column(name = "impact")
    private String impact;

    @Column(name = "added")
    private String added;

    @Column(name = "published")
    private String published;

    @Column(name = "city")
    private String city;

    @Column(name = "country")
    private String country;

    @Column(name = "relevance")
    private Integer relevance;

    @Column(name = "pestle")
    private String pestle;

    @Column(name = "source")
    private String source;

    @Column(name = "title")
    private String title;

    @Column(name = "likelihood")
    private Integer likelihood;
}
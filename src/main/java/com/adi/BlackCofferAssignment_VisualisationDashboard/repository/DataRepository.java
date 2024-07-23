package com.adi.BlackCofferAssignment_VisualisationDashboard.repository;

import com.adi.BlackCofferAssignment_VisualisationDashboard.model.Data;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface DataRepository extends JpaRepository<Data, Long> {
    @Query(value = "SELECT s FROM Data as s WHERE s.sector = :sector")
    List<Data> findAllBySector(@Param("sector") String sct);

    @Query(value = "SELECT Distinct(s.sector) FROM Data as s")
    List<String> findAllDistinctSector();
    @Query(value = "SELECT Distinct(s.region) FROM Data as s")
    List<String> findAllDistinctRegion();
    @Query(value = "SELECT s FROM Data as s WHERE s.region = :reg")
    List<Data> findAllByRegion(@Param("reg")String region);

    @Query("SELECT d.endYear, SUM(d.intensity) AS totalIntensityPerYear " +
            "FROM Data d " +
            "GROUP BY d.endYear " +
            "ORDER BY d.endYear")
    List<Object[]> findYearWiseSumOfIntensity();
    @Query(value = "SELECT s FROM Data as s WHERE s.topic = :top")
    List<Data> findAllByTopic(@Param("top")String topic);
    @Query(value = "SELECT Distinct(s.topic) FROM Data as s")
    List<String> findAllDistinctTopic();
    @Query(value = "SELECT Distinct(s.pestle) FROM Data as s")
    List<String> findAllDistinctPestle();
    @Query(value = "SELECT s FROM Data as s WHERE s.pestle = :pest")
    List<Data> findAllByPestle(@Param("pest")String pestle);
}

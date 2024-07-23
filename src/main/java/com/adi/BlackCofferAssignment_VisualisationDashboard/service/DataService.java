package com.adi.BlackCofferAssignment_VisualisationDashboard.config.service;

import com.adi.BlackCofferAssignment_VisualisationDashboard.model.Data;
import com.adi.BlackCofferAssignment_VisualisationDashboard.repository.DataRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DataService {
    @Autowired
    private DataRepository dataRepository;

    public List<Data> getSectorWiseData(String sct){
        return dataRepository.findAllBySector(sct);
    }

    public List<String> getAllDistinctSector() {
        return dataRepository.findAllDistinctSector();
    }

    public List<String> getAllDistinctRegion() {
        return dataRepository.findAllDistinctRegion();
    }

    public List<Data> getRegionWiseData(String region) {
        return dataRepository.findAllByRegion(region);
    }

    public List<Object[]> getAllEndYearWiseIntensity() {
        return dataRepository.findYearWiseSumOfIntensity();
    }

    public List<Data> getTopicWiseData(String topic) {
        return dataRepository.findAllByTopic(topic);
    }
    public List<String> getAllDistinctTopic() {
        return dataRepository.findAllDistinctTopic();
    }
    public List<Data> getPestleWiseData(String pestle) {
        return dataRepository.findAllByPestle(pestle);
    }
    public List<String> getAllDistinctPestle() {
        return dataRepository.findAllDistinctPestle();
    }
}

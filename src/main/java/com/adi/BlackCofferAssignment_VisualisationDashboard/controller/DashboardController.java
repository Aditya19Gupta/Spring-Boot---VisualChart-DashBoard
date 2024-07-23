package com.adi.BlackCofferAssignment_VisualisationDashboard.controller;

import com.adi.BlackCofferAssignment_VisualisationDashboard.config.service.DataService;
import com.adi.BlackCofferAssignment_VisualisationDashboard.data.ApiResponse;
import com.adi.BlackCofferAssignment_VisualisationDashboard.data.EndWiseDataDTO;
import com.adi.BlackCofferAssignment_VisualisationDashboard.model.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class DashboardController {
    @Autowired
    private DataService dataService;
    @GetMapping("/dashboard")
    public String getDashBoardPage(Model model){
        model.addAttribute("sectors",dataService.getAllDistinctSector());
        model.addAttribute("regionList",dataService.getAllDistinctRegion());
        model.addAttribute("topicList",dataService.getAllDistinctTopic());
        model.addAttribute("pestList",dataService.getAllDistinctPestle());
        return "dashboard";
    }

    @GetMapping("/get-sector-wise-data")
    public ResponseEntity<ApiResponse> getProductGroupData(HttpServletRequest request, Model model) {
        String sector = request.getParameter("sector");
        HashMap<String, Integer> totalSector = new HashMap<>();

        try {
            List<Data> sectorWiseData = dataService.getSectorWiseData(sector);
            sectorWiseData.forEach(e -> {
                String topic  = e.getTopic();
                totalSector.put(topic, totalSector.getOrDefault(topic, 0) + 1);
            });
            return ResponseEntity.ok()
                    .body(new ApiResponse(totalSector, true, "Sector data retrieved successfully"));

        } catch (Exception e) {
            e.printStackTrace();
            // Handle parsing exception
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new ApiResponse(false, "Failed to parse dates"));
        }

    }

    @GetMapping("/get-region-wise-data")
    public ResponseEntity<ApiResponse> getRegionData(HttpServletRequest request, Model model) {
        String region = request.getParameter("region");
        HashMap<String, Integer> totalRegion = new HashMap<>();

        try {
            List<Data> sectorWiseData = dataService.getRegionWiseData(region);
            sectorWiseData.forEach(e -> {
                String sector  = e.getSector();
                totalRegion.put(sector, totalRegion.getOrDefault(sector, 0) + 1);
            });
            return ResponseEntity.ok()
                    .body(new ApiResponse(totalRegion, true, "Region data retrieved successfully"));

        } catch (Exception e) {
            e.printStackTrace();
            // Handle parsing exception
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new ApiResponse(false, "Failed to parse dates"));
        }

    }


    @GetMapping("/get-end-year-wise-data")
    public ResponseEntity<ApiResponse> getEndYearData(HttpServletRequest request, Model model) {
        try {
            List<Object[]> endYearWiseData = dataService.getAllEndYearWiseIntensity();
            List<EndWiseDataDTO> data = endYearWiseData.stream()
                    .map(obj -> new EndWiseDataDTO((Integer) obj[0], (Long) obj[1]))
                    .collect(Collectors.toList());
            data.forEach(e -> {
                System.out.println(e.toString());
            });
            return ResponseEntity.ok()
                    .body(new ApiResponse(data, true, "End Year data retrieved successfully"));

        } catch (Exception e) {
            e.printStackTrace();
            // Handle parsing exception
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new ApiResponse(false, "Failed to parse dates"));
        }

    }
    @GetMapping("/get-topic-wise-data")
    public ResponseEntity<ApiResponse> getTopicData(HttpServletRequest request, Model model) {
        String topic = request.getParameter("topic");
        HashMap<String, Integer> totalTopic = new HashMap<>();

        try {
            List<Data> sectorWiseData = dataService.getTopicWiseData(topic);
            sectorWiseData.forEach(e -> {
                String insights  = e.getInsight();
                totalTopic.put(insights, totalTopic.getOrDefault(insights, 0) + 1);
            });
            return ResponseEntity.ok()
                    .body(new ApiResponse(totalTopic, true, "Topic data retrieved successfully"));

        } catch (Exception e) {
            e.printStackTrace();
            // Handle parsing exception
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new ApiResponse(false, "Failed to parse dates"));
        }

    }


    @GetMapping("/get-pestle-wise-data")
    public ResponseEntity<ApiResponse> getPestleWiseData(HttpServletRequest request, Model model) {
        String pestle = request.getParameter("pestle");
        HashMap<String, Integer> totalPestle = new HashMap<>();

        try {
            List<Data> pestleWiseData = dataService.getPestleWiseData(pestle);
            pestleWiseData.forEach(e -> {
                String source  = e.getSource();
                totalPestle.put(source, totalPestle.getOrDefault(source, 0) + 1);
            });
            return ResponseEntity.ok()
                    .body(new ApiResponse(totalPestle, true, "Pestle data retrieved successfully"));

        } catch (Exception e) {
            e.printStackTrace();
            // Handle parsing exception
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new ApiResponse(false, "Failed to parse dates"));
        }

    }
}

package solutions.delphos.infrastructure.healthcheck.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/healthcheck")
public class HealthCheckController
{
    @GetMapping
    public ResponseEntity<String> check()
    {
        return ResponseEntity.ok("Healthy");
    }
}

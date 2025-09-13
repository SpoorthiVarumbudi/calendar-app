package com.example.calendar;

import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/events")
@CrossOrigin(origins = "*") // Allow frontend calls
public class EventController {

    private final EventRepository repo;

    public EventController(EventRepository repo) {
        this.repo = repo;
    }

    @GetMapping("/today")
    public List<Event> getToday() {
        return repo.findByDate(LocalDate.now());
    }

    @PostMapping
    public Event addEvent(@RequestBody Event event) {
        return repo.save(event);
    }
}

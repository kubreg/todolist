package ru.lovkov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ru.lovkov.entity.Task;
import ru.lovkov.service.TaskService;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

/**
 * Created by kubreg on 20.02.2016.
 */
@Controller
public class TaskController {

    @Autowired
    private TaskService taskService;

    @RequestMapping("createTask")
    public ModelAndView createTask(@ModelAttribute Task task) {
        return new ModelAndView("taskForm");
    }

    @RequestMapping("completeTask")
    public ModelAndView completeTask(@RequestParam int id) {
        taskService.completeTask(id);

        return new ModelAndView("redirect:getAllTasks");
    }

    @RequestMapping("incompleteTask")
    public ModelAndView incompleteTask(@RequestParam int id) {
        taskService.incompleteTask(id);

        return new ModelAndView("redirect:getAllTasks");
    }

    @RequestMapping("editTask")
    public ModelAndView editTask(@RequestParam int id, @ModelAttribute Task task) {
        task = taskService.getTask(id);

        return new ModelAndView("taskForm", "taskObject", task);
    }

    @RequestMapping("saveTask")
    public ModelAndView saveTask(@ModelAttribute Task task) {

        if (task.getId() == 0) {
            taskService.createTask(task);
        } else {
            taskService.updateTask(task);
        }

        return new ModelAndView("redirect:getAllTasks");
    }

    @RequestMapping("deleteTask")
    public ModelAndView deleteTask(@RequestParam int id) {
        taskService.deleteTask(id);

        return new ModelAndView(("redirect:getAllTasks"));
    }

    @RequestMapping(value = {"getAllTasks", "/"})
    public ModelAndView getAllTasks() {
        List<Task> taskList = taskService.getAllTasks();

        taskList.sort(new Comparator<Task>() {
            @Override
            public int compare(Task o1, Task o2) {
                if (!o1.isDone() && o2.isDone()) {
                    return -1;
                } else if (o1.isDone() && !o2.isDone()) {
                    return 1;
                } else {
                    if (o1.getCreated().after(o2.getCreated())) {
                        return -1;
                    } else {
                        return 1;
                    }
                }
            }
        });

        return new ModelAndView("taskList", "taskList", taskList);
    }

    @RequestMapping(value = {"getCompletedTasks"})
    public ModelAndView getCompletedTasks() {
        List<Task> taskList = new ArrayList<>();

        for (Task t : taskService.getAllTasks()) {
            if (t.isDone()) taskList.add(t);
        }

        return new ModelAndView("taskList", "taskList", taskList);
    }

    @RequestMapping(value = {"getIncompleteTasks"})
    public ModelAndView getIncompleteTasks() {
        List<Task> taskList = new ArrayList<>();

        for (Task t : taskService.getAllTasks()) {
            if (!t.isDone()) taskList.add(t);
        }

        return new ModelAndView("taskList", "taskList", taskList);
    }
}

package ru.lovkov.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.lovkov.dao.TaskDAO;
import ru.lovkov.entity.Task;

import java.util.Comparator;
import java.util.Date;
import java.util.List;

/**
 * Created by kubreg on 20.02.2016.
 */
@Service
@Transactional
public class TaskServiceImpl implements TaskService {

    public TaskServiceImpl() {
    }

    @Autowired
    private TaskDAO taskDAO;

    @Override
    public int createTask(Task task) {
        return taskDAO.createTask(task);
    }

    @Override
    public Task updateTask(Task task) {
        Task existingTask = getTask(task.getId());

        existingTask.setTask(task.getTask());

        return taskDAO.updateTask(existingTask);
    }

    @Override
    public void deleteTask(int id) {
        taskDAO.deleteTask(id);
    }

    @Override
    public List<Task> getAllTasks() {
        return taskDAO.getAllTasks();
    }

    @Override
    public Task getTask(int id) {
        return taskDAO.getTask(id);
    }

    @Override
    public void completeTask(int id) {
        Task existingTask = getTask(id);

        existingTask.setCompleted(new Date());
        existingTask.setDone(true);
    }

    @Override
    public void incompleteTask(int id) {
        Task existingTask = getTask(id);

        existingTask.setCompleted(null);
        existingTask.setDone(false);
    }
}

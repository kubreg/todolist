package ru.lovkov.dao;

import ru.lovkov.entity.Task;

import java.util.List;

/**
 * Created by kubreg on 20.02.2016.
 */
public interface TaskDAO {
    int createTask(Task task);
    Task updateTask(Task task);
    void deleteTask(int id);
    List<Task> getAllTasks();
    Task getTask(int id);
}

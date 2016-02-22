package ru.lovkov.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.lovkov.entity.Task;
import ru.lovkov.util.HibernateUtil;

import java.util.List;

/**
 * Created by kubreg on 20.02.2016.
 */
@Repository
public class TaskDAOImpl implements TaskDAO {

    public TaskDAOImpl() {
    }

    @Autowired
    private HibernateUtil hibernateUtil;

    @Override
    public int createTask(Task task) {
        return (int) hibernateUtil.create(task);
    }

    @Override
    public Task updateTask(Task task) {
        return hibernateUtil.update(task);
    }

    @Override
    public void deleteTask(int id) {
        Task task = new Task();
        task.setId(id);
        hibernateUtil.delete(task);
    }

    @Override
    public List<Task> getAllTasks() {
        return hibernateUtil.fetchAll(Task.class);
    }

    @Override
    public Task getTask(int id) {
        return hibernateUtil.fetchById(id, Task.class);
    }
}

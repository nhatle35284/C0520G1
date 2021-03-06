package nhat.coder.blogrestfulreal.service;

import nhat.coder.blogrestfulreal.model.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CategoryService {
    void save(Category category);
    List<Category> getAll();
    Page<Category> findAll(Pageable pageable);
    public Category findById(Long id);
    public void update(Category category);
    void remove(Category category);
}

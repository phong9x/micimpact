package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.app.micimpact.bean.jpa.ErrorsEntity;
import com.app.micimpact.bean.jpa.UploadFilesEntity;

/**
 * Repository : Errors.
 */
public interface ErrorsJpaRepository extends PagingAndSortingRepository<ErrorsEntity, Integer> {
	Page<ErrorsEntity> findAll(Pageable page);
	Page<ErrorsEntity> findByErrorCodeLike(Pageable page, String errorCode);
	Page<ErrorsEntity> findByErrorMassageLike(Pageable page, String errorMessage);
}

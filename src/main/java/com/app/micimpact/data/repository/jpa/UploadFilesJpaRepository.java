package com.app.micimpact.data.repository.jpa;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.app.micimpact.bean.jpa.UploadFilesEntity;

/**
 * Repository : UploadFiles.
 */
public interface UploadFilesJpaRepository extends PagingAndSortingRepository<UploadFilesEntity, Integer> {
	List<UploadFilesEntity> findByDomainLike(String domain);
	List<UploadFilesEntity> findByOwnerIdAndDomain(Integer ownerId, String domain);
	List<UploadFilesEntity> findByIdIn(List<Integer> ids);
	
	Page<UploadFilesEntity> findAll(Pageable page);
	Page<UploadFilesEntity> findByDomainLike(Pageable page, String domain);
}

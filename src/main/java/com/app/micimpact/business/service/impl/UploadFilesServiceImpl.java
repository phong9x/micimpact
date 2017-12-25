
package com.app.micimpact.business.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.app.micimpact.bean.UploadFiles;
import com.app.micimpact.bean.jpa.UploadFilesEntity;
import com.app.micimpact.business.service.UploadFilesService;
import com.app.micimpact.business.service.mapping.UploadFilesServiceMapper;
import com.app.micimpact.data.repository.jpa.UploadFilesJpaRepository;
import com.app.micimpact.web.common.BasicEnvironment;

/**
 * Implementation of UploadFilesService
 */
@Component
@Transactional
public class UploadFilesServiceImpl implements UploadFilesService {

	public static final String UPLOAD_PATH_ROOT = "c:\\upload";
	
	@Resource
	private UploadFilesJpaRepository uploadFilesJpaRepository;

	@Resource
	private UploadFilesServiceMapper uploadFilesServiceMapper;
	
	@Override
	public UploadFiles findById(Integer id) {
		UploadFilesEntity uploadFilesEntity = uploadFilesJpaRepository.findOne(id);
		return uploadFilesServiceMapper.mapUploadFilesEntityToUploadFiles(uploadFilesEntity);
	}

	@Override
	public List<UploadFiles> findAll() {
		Iterable<UploadFilesEntity> entities = uploadFilesJpaRepository.findAll();
		List<UploadFiles> beans = new ArrayList<UploadFiles>();
		for(UploadFilesEntity uploadFilesEntity : entities) {
			beans.add(uploadFilesServiceMapper.mapUploadFilesEntityToUploadFiles(uploadFilesEntity));
		}
		return beans;
	}

	@Override
	public UploadFiles save(UploadFiles uploadFiles) {
		return update(uploadFiles) ;
	}

	@Override
	public UploadFiles create(UploadFiles uploadFiles) {
		UploadFilesEntity uploadFilesEntity;
		if(uploadFiles.getId() != null){
			uploadFilesEntity = uploadFilesJpaRepository.findOne(uploadFiles.getId());
			if( uploadFilesEntity != null ) {
				throw new IllegalStateException("already.exists");
			}
		}
		uploadFilesEntity = new UploadFilesEntity();
		uploadFilesServiceMapper.mapUploadFilesToUploadFilesEntity(uploadFiles, uploadFilesEntity);
		UploadFilesEntity uploadFilesEntitySaved = uploadFilesJpaRepository.save(uploadFilesEntity);
		return uploadFilesServiceMapper.mapUploadFilesEntityToUploadFiles(uploadFilesEntitySaved);
	}

	@Override
	public UploadFiles update(UploadFiles uploadFiles) {
		UploadFilesEntity uploadFilesEntity = uploadFilesJpaRepository.findOne(uploadFiles.getId());
		uploadFilesServiceMapper.mapUploadFilesToUploadFilesEntity(uploadFiles, uploadFilesEntity);
		UploadFilesEntity uploadFilesEntitySaved = uploadFilesJpaRepository.save(uploadFilesEntity);
		return uploadFilesServiceMapper.mapUploadFilesEntityToUploadFiles(uploadFilesEntitySaved);
	}

	@Override
	public void delete(Integer id) {
		uploadFilesJpaRepository.delete(id);
	}

	public UploadFilesJpaRepository getUploadFilesJpaRepository() {
		return uploadFilesJpaRepository;
	}

	public void setUploadFilesJpaRepository(UploadFilesJpaRepository uploadFilesJpaRepository) {
		this.uploadFilesJpaRepository = uploadFilesJpaRepository;
	}

	public UploadFilesServiceMapper getUploadFilesServiceMapper() {
		return uploadFilesServiceMapper;
	}

	public void setUploadFilesServiceMapper(UploadFilesServiceMapper uploadFilesServiceMapper) {
		this.uploadFilesServiceMapper = uploadFilesServiceMapper;
	}

	@Override
	public List<UploadFiles> findByDomainLike(String strDomain) {
		// TODO Auto-generated method stub
		String strKeyword = "%"+strDomain+"%";
		
		Iterable<UploadFilesEntity> entities = uploadFilesJpaRepository.findByDomainLike(strKeyword);
		
		List<UploadFiles> beansFiles = new ArrayList<UploadFiles>();
		
		for (UploadFilesEntity fileEntity : entities)
		{
			UploadFiles file = uploadFilesServiceMapper.mapUploadFilesEntityToUploadFiles(fileEntity);
			beansFiles.add(file);
		}
		
		return beansFiles;
	}
	
	@Override
	public List<UploadFiles> findByOwnerAndDomain(Integer owner, String domain) {
		Iterable<UploadFilesEntity> entities = uploadFilesJpaRepository.findByOwnerIdAndDomain(owner,domain);
		List<UploadFiles> beans = new ArrayList<UploadFiles>();
		for(UploadFilesEntity uploadFilesEntity : entities) {
			beans.add(uploadFilesServiceMapper.mapUploadFilesEntityToUploadFiles(uploadFilesEntity));
		}
		return beans;
	}

	@Override
	public void deleteIn(List<Integer> ids) {
		Iterable<UploadFilesEntity> entities = uploadFilesJpaRepository.findByIdIn(ids);
		for(UploadFilesEntity uploadFilesEntity : entities) {
			String FULL_PATH = UPLOAD_PATH_ROOT+"/"+uploadFilesEntity.getDomain()+"/"+uploadFilesEntity.getPath();
			File file = new File(FULL_PATH);
			file.delete();
			uploadFilesJpaRepository.delete(uploadFilesEntity.getId());
		}
	}

	@Override
	public List<UploadFiles> findByIdIn(List<Integer> ids) {
		Iterable<UploadFilesEntity> entities = uploadFilesJpaRepository.findByIdIn(ids);
		List<UploadFiles> beans = new ArrayList<UploadFiles>();
		for(UploadFilesEntity uploadFilesEntity : entities) {
			beans.add(uploadFilesServiceMapper.mapUploadFilesEntityToUploadFiles(uploadFilesEntity));
		}
		return beans;
	}

	@Override
	public Page<UploadFilesEntity> findAll(Integer pageNumber) {
		// TODO Auto-generated method stub
		PageRequest request =  new PageRequest(pageNumber - 1, BasicEnvironment.PAGE_SIZE, 
				 new Sort(new Order(Direction.DESC, "id")));
		
		return uploadFilesJpaRepository.findAll(request);
	}

	@Override
	public Page<UploadFilesEntity> findSearchAll(Integer pageNumber, Integer option,
			String keyword) {
		// TODO Auto-generated method stub
		String value = "%"+keyword+"%";//검색 조건
		PageRequest request =  new PageRequest(pageNumber - 1, BasicEnvironment.PAGE_SIZE, 
				 new Sort(new Order(Direction.DESC, "id")));
		
		switch (option) {
			case 1:
				return uploadFilesJpaRepository.findByDomainLike(request ,value);
		}
		
		return null;
	}

}

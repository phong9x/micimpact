package com.app.micimpact.business.service.mapping;

import javax.annotation.Resource;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;

import com.app.micimpact.bean.Postings;
import com.app.micimpact.bean.jpa.PostingTypesEntity;
import com.app.micimpact.bean.jpa.PostingsEntity;
import com.app.micimpact.bean.jpa.UsersEntity;
import com.app.micimpact.business.service.UsersService;

/**
 * Mapping between entity beans and display beans.
 */
@Component
public class PostingsServiceMapper extends AbstractServiceMapper {

	@Resource
	private UsersService usersService;
	
	@Resource
	private UsersServiceMapper usersServiceMapper;
	
	/**
	 * ModelMapper : bean to bean mapping library.
	 */
	private ModelMapper modelMapper;
	
	/**
	 * Constructor.
	 */
	public PostingsServiceMapper() {
		modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Mapping from 'PostingsEntity' to 'Postings'
	 * @param postingsEntity
	 */
	public Postings mapPostingsEntityToPostings(PostingsEntity postingsEntity) {
		if(postingsEntity == null) {
			return null;
		}

		//--- Generic mapping 
		Postings postings = map(postingsEntity, Postings.class);

		//--- Link mapping ( link to PostingTypes )
		if(postingsEntity.getPostingTypes() != null) {
			postings.setTypeId(postingsEntity.getPostingTypes().getId());
		}
		//--- Link mapping ( link to Users )
		if(postingsEntity.getUsers() != null) {
			postings.setUserId(postingsEntity.getUsers().getId());
		}
		return postings;
	}
	
	/**
	 * Mapping from 'Postings' to 'PostingsEntity'
	 * @param postings
	 * @param postingsEntity
	 */
	public void mapPostingsToPostingsEntity(Postings postings, PostingsEntity postingsEntity) {
		if(postings == null) {
			return;
		}

		//--- Generic mapping 
		map(postings, postingsEntity);

		//--- Link mapping ( link : postings )
		if( hasLinkToPostingTypes(postings) ) {
			PostingTypesEntity postingTypes1 = new PostingTypesEntity();
			postingTypes1.setId( postings.getTypeId() );
			postingsEntity.setPostingTypes( postingTypes1 );
		} else {
			postingsEntity.setPostingTypes( null );
		}

		//--- Link mapping ( link : postings )
		if( hasLinkToUsers(postings) ) {
			UsersEntity users2 = new UsersEntity();
			usersServiceMapper.mapUsersToUsersEntity(usersService.findById(postings.getUserId()), users2);
//			users2.setId( postings.getUserId() );
			postingsEntity.setUsers( users2 );
		} else {
			postingsEntity.setUsers( null );
		}

	}
	
	/**
	 * Verify that PostingTypes id is valid.
	 * @param PostingTypes PostingTypes
	 * @return boolean
	 */
	private boolean hasLinkToPostingTypes(Postings postings) {
		if(postings.getTypeId() != null) {
			return true;
		}
		return false;
	}

	/**
	 * Verify that Users id is valid.
	 * @param Users Users
	 * @return boolean
	 */
	private boolean hasLinkToUsers(Postings postings) {
		if(postings.getUserId() != null) {
			return true;
		}
		return false;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	protected ModelMapper getModelMapper() {
		return modelMapper;
	}

	protected void setModelMapper(ModelMapper modelMapper) {
		this.modelMapper = modelMapper;
	}

}

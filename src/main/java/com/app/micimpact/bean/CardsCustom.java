/*
 * Created on 21 12월 2015 ( Time 14:20:18 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.bean;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class CardsCustom implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @NotNull
    private Integer id;

    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    
    @NotNull
    private Integer userId;

    @NotNull
    private Integer categoryId;

    @Size( max = 256 )
    private String thumbnailUrl;

    @Size( max = 256 )
    private String targetUrl;

    @Size( max = 256 )
    private String title;

    @Size( max = 128 )
    private String actor;
    
    @Size( max = 128 )
    private String actorJob;
    
    @NotNull
    @Size( min = 1, max = 512 )
    private String body;


    private Integer type;


    private Integer countLike;


    private Integer share;


    private Integer runingTime;

    @NotNull
    private Date createdAt;


    private Integer adIs;

    @Size( max = 128 )
    private String adMent;

    @Size( max = 256 )
    private String adLink;

    private Integer relatedCardId;

    private Integer hitCount;
    
    private Integer commentCount;

    
    @Size( max = 256 )
    private String verticalThumbnailUrl;
    
    @Size( max = 300 )
    private String channelId;
    //----------------------------------------------------------------------
    // GETTER & SETTER FOR THE KEY FIELD
    //----------------------------------------------------------------------
    public void setId( Integer id ) {
        this.id = id ;
    }

    public Integer getId() {
        return this.id;
    }


    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR FIELDS
    //----------------------------------------------------------------------
    public void setUserId( Integer userId ) {
        this.userId = userId;
    }
    public Integer getUserId() {
        return this.userId;
    }

    public void setCategoryId( Integer categoryId ) {
        this.categoryId = categoryId;
    }
    public Integer getCategoryId() {
        return this.categoryId;
    }

    public void setThumbnailUrl( String thumbnailUrl ) {
        this.thumbnailUrl = thumbnailUrl;
    }
    public String getThumbnailUrl() {
        return this.thumbnailUrl;
    }

    public void setTargetUrl( String targetUrl ) {
        this.targetUrl = targetUrl;
    }
    public String getTargetUrl() {
        return this.targetUrl;
    }

    public void setTitle( String title ) {
        this.title = title;
    }
    public String getTitle() {
        return this.title;
    }

    public void setBody( String body ) {
        this.body = body;
    }
    public String getBody() {
        return this.body;
    }

    public void setType( Integer type ) {
        this.type = type;
    }
    public Integer getType() {
        return this.type;
    }

    public void setCountLike( Integer countLike ) {
        this.countLike = countLike;
    }
    public Integer getCountLike() {
        return this.countLike;
    }

    public void setShare( Integer share ) {
        this.share = share;
    }
    public Integer getShare() {
        return this.share;
    }

    public void setRuningTime( Integer runingTime ) {
        this.runingTime = runingTime;
    }
    public Integer getRuningTime() {
        return this.runingTime;
    }

    public void setCreatedAt( Date createdAt ) {
        this.createdAt = createdAt;
    }
    public Date getCreatedAt() {
        return this.createdAt;
    }

    public void setAdIs( Integer adIs ) {
        this.adIs = adIs;
    }
    public Integer getAdIs() {
        return this.adIs;
    }

    public void setAdMent( String adMent ) {
        this.adMent = adMent;
    }
    public String getAdMent() {
        return this.adMent;
    }

    public void setAdLink( String adLink ) {
        this.adLink = adLink;
    }
    public String getAdLink() {
        return this.adLink;
    }

    public void setRelatedCardId( Integer relatedCardId ) {
        this.relatedCardId = relatedCardId;
    }
    
    public Integer getRelatedCardId() {
        return this.relatedCardId;
    }
    
    public void setHitCount( Integer hitCount ) {
        this.hitCount = hitCount;
    }
    
    public Integer getHitCount() {
        return this.hitCount;
    }
    
    public void setCommentCount( Integer commentCount ) {
        this.commentCount = commentCount;
    }
    
    public Integer getCommentCount() {
        return this.commentCount;
    }
    
    public void setActor( String actor ) {
        this.actor = actor;
    }
    
    public String getActor() {
        return this.actor;
    }
    
    public void setActorJob( String actorJob ) {
        this.actorJob = actorJob;
    }
    
    public String getActorJob() {
        return this.actorJob;
    }
    
    public void setVerticalThumbnailUrl( String verticalThumbnailUrl ) {
        this.verticalThumbnailUrl = verticalThumbnailUrl;
    }
    public String getVerticalThumbnailUrl() {
        return this.verticalThumbnailUrl;
    }
    
    public void setChannelId( String channelId ) {
        this.channelId = channelId;
    }
    public String getChannelId() {
        return this.channelId;
    }
    
    //Newwwwwwwww
    private List<String> m_images;
    private List<String> m_tags;
    private String job;
    private Boolean is_like=false;
    
	private String userName;
    
    private String categoryName;
    
    public void setIsLike( Boolean is_like ) {
        this.is_like = is_like;
    }
    
    public Boolean getIsLike() {
        return this.is_like;
    }
    
    public List<String> getM_images() {
		return m_images;
	}

	public void setM_images(List<String> m_images) {
		this.m_images = m_images;
	}

	public List<String> getM_tags() {
		return m_tags;
	}

	public void setM_tags(List<String> m_tags) {
		this.m_tags = m_tags;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public List<String> getImages()
    {
    	return m_images;
    }
    public void setImages(List<String> images)
    {
    	m_images = images;
    }
    
    public List<String> getTags()
    {
    	return m_tags;
    }
    public void setTags(List<String> tags)
    {
    	m_tags = tags;
    }
    

    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
 
    public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append(id);
        sb.append("|");
        sb.append(userId);
        sb.append("|");
        sb.append(categoryId);
        sb.append("|");
        sb.append(thumbnailUrl);
        sb.append("|");
        sb.append(targetUrl);
        sb.append("|");
        sb.append(title);
        sb.append("|");
        sb.append(body);
        sb.append("|");
        sb.append(type);
        sb.append("|");
        sb.append(countLike);
        sb.append("|");
        sb.append(share);
        sb.append("|");
        sb.append(runingTime);
        sb.append("|");
        sb.append(createdAt);
        sb.append("|");
        sb.append(adIs);
        sb.append("|");
        sb.append(adMent);
        sb.append("|");
        sb.append(adLink);
        sb.append("|");
        sb.append(relatedCardId);
        sb.append("|");
        sb.append(hitCount);
        sb.append("|");
        sb.append(commentCount);
        sb.append("|");
        sb.append(actor);
        sb.append("|");
        sb.append(actorJob);
        sb.append("|");
        sb.append(verticalThumbnailUrl);
        sb.append("|");
        sb.append(channelId);
        return sb.toString(); 
    } 


}
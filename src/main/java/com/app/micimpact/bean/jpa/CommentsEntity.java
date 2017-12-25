/*
 * Created on 14 Apr 2016 ( Time 13:54:31 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
// This Bean has a basic Primary Key (not composite) 

package com.app.micimpact.bean.jpa;

import java.io.Serializable;

//import javax.validation.constraints.* ;
//import org.hibernate.validator.constraints.* ;

import java.util.Date;

import javax.persistence.*;

/**
 * Persistent class for entity stored in table "comments"
 *
 * @author Telosys Tools Generator
 *
 */

@Entity
@Table(name="comments", catalog="micimpact" )
// Define named queries here
@NamedQueries ( {
  @NamedQuery ( name="CommentsEntity.countAll", query="SELECT COUNT(x) FROM CommentsEntity x" )
} )
public class CommentsEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id", nullable=false)
    private Integer    id           ;


    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    
    @Column(name="card_id", nullable=false)
    private Integer    cardId       ;

    @Column(name="user_id", nullable=false)
    private Integer    userId       ;

    @Column(name="body", length=2000)
    private String     body         ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="created_at", nullable=false)
    private Date       createdAt    ;

    @Column(name="count_like")
    private Integer    countLike    ;

    @Column(name="is_like")
    private Boolean    isLike       ;

    @Column(name="user_name", length=255)
    private String     userName     ;

    @Column(name="is_show")
    private Integer    isShow       ;

    @Column(name="count_report")
    private Integer    countReport  ;



    //----------------------------------------------------------------------
    // ENTITY LINKS ( RELATIONSHIP )
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------
    // CONSTRUCTOR(S)
    //----------------------------------------------------------------------
    public CommentsEntity() {
		super();
    }
    
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
    //--- DATABASE MAPPING : card_id ( INT ) 
    public void setCardId( Integer cardId ) {
        this.cardId = cardId;
    }
    public Integer getCardId() {
        return this.cardId;
    }

    //--- DATABASE MAPPING : user_id ( INT ) 
    public void setUserId( Integer userId ) {
        this.userId = userId;
    }
    public Integer getUserId() {
        return this.userId;
    }

    //--- DATABASE MAPPING : body ( VARCHAR ) 
    public void setBody( String body ) {
        this.body = body;
    }
    public String getBody() {
        return this.body;
    }

    //--- DATABASE MAPPING : created_at ( TIMESTAMP ) 
    public void setCreatedAt( Date createdAt ) {
        this.createdAt = createdAt;
    }
    public Date getCreatedAt() {
        return this.createdAt;
    }

    //--- DATABASE MAPPING : count_like ( INT ) 
    public void setCountLike( Integer countLike ) {
        this.countLike = countLike;
    }
    public Integer getCountLike() {
        return this.countLike;
    }

    //--- DATABASE MAPPING : is_like ( BIT ) 
    public void setIsLike( Boolean isLike ) {
        this.isLike = isLike;
    }
    public Boolean getIsLike() {
        return this.isLike;
    }

    //--- DATABASE MAPPING : user_name ( VARCHAR ) 
    public void setUserName( String userName ) {
        this.userName = userName;
    }
    public String getUserName() {
        return this.userName;
    }

    //--- DATABASE MAPPING : is_show ( INT ) 
    public void setIsShow( Integer isShow ) {
        this.isShow = isShow;
    }
    public Integer getIsShow() {
        return this.isShow;
    }

    //--- DATABASE MAPPING : count_report ( INT ) 
    public void setCountReport( Integer countReport ) {
        this.countReport = countReport;
    }
    public Integer getCountReport() {
        return this.countReport;
    }


    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR LINKS
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
    public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append("["); 
        sb.append(id);
        sb.append("]:"); 
        sb.append(cardId);
        sb.append("|");
        sb.append(userId);
        sb.append("|");
        sb.append(body);
        sb.append("|");
        sb.append(createdAt);
        sb.append("|");
        sb.append(countLike);
        sb.append("|");
        sb.append(isLike);
        sb.append("|");
        sb.append(userName);
        sb.append("|");
        sb.append(isShow);
        sb.append("|");
        sb.append(countReport);
        return sb.toString(); 
    } 

}

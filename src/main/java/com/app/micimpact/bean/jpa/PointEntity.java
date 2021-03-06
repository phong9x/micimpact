/*
 * Created on 1 Apr 2016 ( Time 11:03:51 )
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
 * Persistent class for entity stored in table "point"
 *
 * @author Telosys Tools Generator
 *
 */

@Entity
@Table(name="point", catalog="micimpact" )
// Define named queries here
@NamedQueries ( {
  @NamedQuery ( name="PointEntity.countAll", query="SELECT COUNT(x) FROM PointEntity x" )
} )
public class PointEntity implements Serializable {

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
    @Column(name="user_id", nullable=false)
    private Integer    userId       ;

    @Column(name="login_times")
    private Integer    loginTimes   ;

    @Column(name="comment_times")
    private Integer    commentTimes ;

    @Column(name="share_times")
    private Integer    shareTimes   ;

    @Column(name="see_content_times")
    private Integer    seeContentTimes ;

    @Temporal(TemporalType.DATE)
    @Column(name="creatAt")
    private Date       creatat      ;



    //----------------------------------------------------------------------
    // ENTITY LINKS ( RELATIONSHIP )
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------
    // CONSTRUCTOR(S)
    //----------------------------------------------------------------------
    public PointEntity() {
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
    //--- DATABASE MAPPING : user_id ( INT ) 
    public void setUserId( Integer userId ) {
        this.userId = userId;
    }
    public Integer getUserId() {
        return this.userId;
    }

    //--- DATABASE MAPPING : login_times ( INT ) 
    public void setLoginTimes( Integer loginTimes ) {
        this.loginTimes = loginTimes;
    }
    public Integer getLoginTimes() {
        return this.loginTimes;
    }

    //--- DATABASE MAPPING : comment_times ( INT ) 
    public void setCommentTimes( Integer commentTimes ) {
        this.commentTimes = commentTimes;
    }
    public Integer getCommentTimes() {
        return this.commentTimes;
    }

    //--- DATABASE MAPPING : share_times ( INT ) 
    public void setShareTimes( Integer shareTimes ) {
        this.shareTimes = shareTimes;
    }
    public Integer getShareTimes() {
        return this.shareTimes;
    }

    //--- DATABASE MAPPING : see_content_times ( INT ) 
    public void setSeeContentTimes( Integer seeContentTimes ) {
        this.seeContentTimes = seeContentTimes;
    }
    public Integer getSeeContentTimes() {
        return this.seeContentTimes;
    }

    //--- DATABASE MAPPING : creatAt ( DATE ) 
    public void setCreatat( Date creatat ) {
        this.creatat = creatat;
    }
    public Date getCreatat() {
        return this.creatat;
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
        sb.append(userId);
        sb.append("|");
        sb.append(loginTimes);
        sb.append("|");
        sb.append(commentTimes);
        sb.append("|");
        sb.append(shareTimes);
        sb.append("|");
        sb.append(seeContentTimes);
        sb.append("|");
        sb.append(creatat);
        return sb.toString(); 
    } 

}

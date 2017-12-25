/*
 * Created on 31 Mar 2016 ( Time 15:32:37 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
// This Bean has a basic Primary Key (not composite) 

package com.app.micimpact.bean.jpa;

import java.io.Serializable;

//import javax.validation.constraints.* ;
//import org.hibernate.validator.constraints.* ;

import java.util.Date;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Persistent class for entity stored in table "users"
 *
 * @author Telosys Tools Generator
 *
 */

@Entity
@Table(name="users", catalog="micimpact" )
// Define named queries here
@NamedQueries ( {
  @NamedQuery ( name="UsersEntity.countAll", query="SELECT COUNT(x) FROM UsersEntity x" )
} )
public class UsersEntity implements Serializable {

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
    @Column(name="password", nullable=false, length=256)
    private String     password     ;

    @Column(name="name", nullable=false, length=255)
    private String     name         ;

    @Column(name="email", length=255)
    private String     email        ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="created_at", nullable=false)
    private Date       createdAt    ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="updated_at", nullable=false)
    private Date       updatedAt    ;

    @Column(name="fag")
    private Integer    fag          ;

    @Column(name="facebook_token", length=256)
    private String     facebookToken ;

    @Column(name="kakaotalk_token", length=256)
    private String     kakaotalkToken ;

    @Column(name="line_token", length=256)
    private String     lineToken    ;

    @Column(name="birthyear", length=4)
    private String     birthyear    ;

    @Column(name="sex", length=1)
    private String     sex          ;

    @Column(name="job", length=32)
    private String     job          ;

    @Column(name="city", length=32)
    private String     city         ;

    @Column(name="activity_point")
    private Integer    activityPoint ;

    @Column(name="level")
    private Integer    level        ;

    @Column(name="point")
    private Integer    point        ;

    @Column(name="device_ios_id")
    private String     deviceIosId  ;

    @Column(name="applicant_android_id")
    private String     applicantAndroidId ;

    @Column(name="push_state")
    private Integer    pushState    ;

    @Column(name="profile_url", length=128)
    private String     profileUrl   ;

    @Column(name="is_withdrawn")
    private Integer    isWithdrawn  ;

    @Column(name="heart_state_id")
    private Integer    heartStateId ;

    @Column(name="recent_card_id")
    private Integer    recentCardId ;

	// "roleId" (column "role_id") is not defined by itself because used as FK in a link 


    //----------------------------------------------------------------------
    // ENTITY LINKS ( RELATIONSHIP )
    //----------------------------------------------------------------------
    @JsonIgnore
    @OneToMany(mappedBy="users", targetEntity=PostingsEntity.class)
    private List<PostingsEntity> listOfPostings;
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name="role_id", referencedColumnName="id")
    private UserRolesEntity userRoles   ;
    @JsonIgnore
    @OneToMany(mappedBy="users", targetEntity=ChannelEntity.class)
    private List<ChannelEntity> listOfChannel;


    //----------------------------------------------------------------------
    // CONSTRUCTOR(S)
    //----------------------------------------------------------------------
    public UsersEntity() {
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
    //--- DATABASE MAPPING : password ( VARCHAR ) 
    public void setPassword( String password ) {
        this.password = password;
    }
    public String getPassword() {
        return this.password;
    }

    //--- DATABASE MAPPING : name ( VARCHAR ) 
    public void setName( String name ) {
        this.name = name;
    }
    public String getName() {
        return this.name;
    }

    //--- DATABASE MAPPING : email ( VARCHAR ) 
    public void setEmail( String email ) {
        this.email = email;
    }
    public String getEmail() {
        return this.email;
    }

    //--- DATABASE MAPPING : created_at ( TIMESTAMP ) 
    public void setCreatedAt( Date createdAt ) {
        this.createdAt = createdAt;
    }
    public Date getCreatedAt() {
        return this.createdAt;
    }

    //--- DATABASE MAPPING : updated_at ( TIMESTAMP ) 
    public void setUpdatedAt( Date updatedAt ) {
        this.updatedAt = updatedAt;
    }
    public Date getUpdatedAt() {
        return this.updatedAt;
    }

    //--- DATABASE MAPPING : fag ( INT ) 
    public void setFag( Integer fag ) {
        this.fag = fag;
    }
    public Integer getFag() {
        return this.fag;
    }

    //--- DATABASE MAPPING : facebook_token ( VARCHAR ) 
    public void setFacebookToken( String facebookToken ) {
        this.facebookToken = facebookToken;
    }
    public String getFacebookToken() {
        return this.facebookToken;
    }

    //--- DATABASE MAPPING : kakaotalk_token ( VARCHAR ) 
    public void setKakaotalkToken( String kakaotalkToken ) {
        this.kakaotalkToken = kakaotalkToken;
    }
    public String getKakaotalkToken() {
        return this.kakaotalkToken;
    }

    //--- DATABASE MAPPING : line_token ( VARCHAR ) 
    public void setLineToken( String lineToken ) {
        this.lineToken = lineToken;
    }
    public String getLineToken() {
        return this.lineToken;
    }

    //--- DATABASE MAPPING : birthyear ( CHAR ) 
    public void setBirthyear( String birthyear ) {
        this.birthyear = birthyear;
    }
    public String getBirthyear() {
        return this.birthyear;
    }

    //--- DATABASE MAPPING : sex ( CHAR ) 
    public void setSex( String sex ) {
        this.sex = sex;
    }
    public String getSex() {
        return this.sex;
    }

    //--- DATABASE MAPPING : job ( VARCHAR ) 
    public void setJob( String job ) {
        this.job = job;
    }
    public String getJob() {
        return this.job;
    }

    //--- DATABASE MAPPING : city ( VARCHAR ) 
    public void setCity( String city ) {
        this.city = city;
    }
    public String getCity() {
        return this.city;
    }

    //--- DATABASE MAPPING : activity_point ( INT ) 
    public void setActivityPoint( Integer activityPoint ) {
        this.activityPoint = activityPoint;
    }
    public Integer getActivityPoint() {
        return this.activityPoint;
    }

    //--- DATABASE MAPPING : level ( INT ) 
    public void setLevel( Integer level ) {
        this.level = level;
    }
    public Integer getLevel() {
        return this.level;
    }

    //--- DATABASE MAPPING : point ( INT ) 
    public void setPoint( Integer point ) {
        this.point = point;
    }
    public Integer getPoint() {
        return this.point;
    }

    //--- DATABASE MAPPING : device_ios_id ( TEXT ) 
    public void setDeviceIosId( String deviceIosId ) {
        this.deviceIosId = deviceIosId;
    }
    public String getDeviceIosId() {
        return this.deviceIosId;
    }

    //--- DATABASE MAPPING : applicant_android_id ( TEXT ) 
    public void setApplicantAndroidId( String applicantAndroidId ) {
        this.applicantAndroidId = applicantAndroidId;
    }
    public String getApplicantAndroidId() {
        return this.applicantAndroidId;
    }

    //--- DATABASE MAPPING : push_state ( INT ) 
    public void setPushState( Integer pushState ) {
        this.pushState = pushState;
    }
    public Integer getPushState() {
        return this.pushState;
    }

    //--- DATABASE MAPPING : profile_url ( VARCHAR ) 
    public void setProfileUrl( String profileUrl ) {
        this.profileUrl = profileUrl;
    }
    public String getProfileUrl() {
        return this.profileUrl;
    }

    //--- DATABASE MAPPING : is_withdrawn ( INT ) 
    public void setIsWithdrawn( Integer isWithdrawn ) {
        this.isWithdrawn = isWithdrawn;
    }
    public Integer getIsWithdrawn() {
        return this.isWithdrawn;
    }

    //--- DATABASE MAPPING : heart_state_id ( INT ) 
    public void setHeartStateId( Integer heartStateId ) {
        this.heartStateId = heartStateId;
    }
    public Integer getHeartStateId() {
        return this.heartStateId;
    }

    //--- DATABASE MAPPING : recent_card_id ( INT ) 
    public void setRecentCardId( Integer recentCardId ) {
        this.recentCardId = recentCardId;
    }
    public Integer getRecentCardId() {
        return this.recentCardId;
    }


    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR LINKS
    //----------------------------------------------------------------------
    public void setListOfPostings( List<PostingsEntity> listOfPostings ) {
        this.listOfPostings = listOfPostings;
    }
    public List<PostingsEntity> getListOfPostings() {
        return this.listOfPostings;
    }

    public void setUserRoles( UserRolesEntity userRoles ) {
        this.userRoles = userRoles;
    }
    public UserRolesEntity getUserRoles() {
        return this.userRoles;
    }

    public void setListOfChannel( List<ChannelEntity> listOfChannel ) {
        this.listOfChannel = listOfChannel;
    }
    public List<ChannelEntity> getListOfChannel() {
        return this.listOfChannel;
    }


    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
    public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append("["); 
        sb.append(id);
        sb.append("]:"); 
        sb.append(password);
        sb.append("|");
        sb.append(name);
        sb.append("|");
        sb.append(email);
        sb.append("|");
        sb.append(createdAt);
        sb.append("|");
        sb.append(updatedAt);
        sb.append("|");
        sb.append(fag);
        sb.append("|");
        sb.append(facebookToken);
        sb.append("|");
        sb.append(kakaotalkToken);
        sb.append("|");
        sb.append(lineToken);
        sb.append("|");
        sb.append(birthyear);
        sb.append("|");
        sb.append(sex);
        sb.append("|");
        sb.append(job);
        sb.append("|");
        sb.append(city);
        sb.append("|");
        sb.append(activityPoint);
        sb.append("|");
        sb.append(level);
        sb.append("|");
        sb.append(point);
        // attribute 'deviceIosId' not usable (type = String Long Text)
        // attribute 'applicantAndroidId' not usable (type = String Long Text)
        sb.append("|");
        sb.append(pushState);
        sb.append("|");
        sb.append(profileUrl);
        sb.append("|");
        sb.append(isWithdrawn);
        sb.append("|");
        sb.append(heartStateId);
        sb.append("|");
        sb.append(recentCardId);
        return sb.toString(); 
    } 

}

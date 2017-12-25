/*
 * Created on 20 5�� 2015 ( Time 17:27:36 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
// This Bean has a basic Primary Key (not composite) 

package com.app.micimpact.bean.jpa;

import java.io.Serializable;

//import javax.validation.constraints.* ;
//import org.hibernate.validator.constraints.* ;

import java.util.Date;

import javax.persistence.*;

/**
 * Persistent class for entity stored in table "popups"
 *
 * @author Telosys Tools Generator
 *
 */

@Entity
@Table(name="popups", catalog="micimpact" )
// Define named queries here
@NamedQueries ( {
  @NamedQuery ( name="PopupsEntity.countAll", query="SELECT COUNT(x) FROM PopupsEntity x" )
} )
public class PopupsEntity implements Serializable {

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
    @Column(name="name", length=64)
    private String     name         ;

    @Column(name="locale", length=16)
    private String     locale       ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="start_at")
    private Date       startAt      ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="end_at")
    private Date       endAt        ;

    @Column(name="image_url", length=128)
    private String     imageUrl     ;



    //----------------------------------------------------------------------
    // ENTITY LINKS ( RELATIONSHIP )
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------
    // CONSTRUCTOR(S)
    //----------------------------------------------------------------------
    public PopupsEntity() {
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
    //--- DATABASE MAPPING : name ( CHAR ) 
    public void setName( String name ) {
        this.name = name;
    }
    public String getName() {
        return this.name;
    }

    //--- DATABASE MAPPING : locale ( CHAR ) 
    public void setLocale( String locale ) {
        this.locale = locale;
    }
    public String getLocale() {
        return this.locale;
    }

    //--- DATABASE MAPPING : start_at ( DATETIME ) 
    public void setStartAt( Date startAt ) {
        this.startAt = startAt;
    }
    public Date getStartAt() {
        return this.startAt;
    }

    //--- DATABASE MAPPING : end_at ( DATETIME ) 
    public void setEndAt( Date endAt ) {
        this.endAt = endAt;
    }
    public Date getEndAt() {
        return this.endAt;
    }

    //--- DATABASE MAPPING : image_url ( CHAR ) 
    public void setImageUrl( String imageUrl ) {
        this.imageUrl = imageUrl;
    }
    public String getImageUrl() {
        return this.imageUrl;
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
        sb.append(name);
        sb.append("|");
        sb.append(locale);
        sb.append("|");
        sb.append(startAt);
        sb.append("|");
        sb.append(endAt);
        sb.append("|");
        sb.append(imageUrl);
        return sb.toString(); 
    } 

}
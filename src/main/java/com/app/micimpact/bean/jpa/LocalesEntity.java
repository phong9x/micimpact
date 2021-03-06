/*
 * Created on 13 5�� 2015 ( Time 19:15:38 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
// This Bean has a basic Primary Key (not composite) 

package com.app.micimpact.bean.jpa;

import java.io.Serializable;

//import javax.validation.constraints.* ;
//import org.hibernate.validator.constraints.* ;


import javax.persistence.*;

/**
 * Persistent class for entity stored in table "locales"
 *
 * @author Telosys Tools Generator
 *
 */

@Entity
@Table(name="locales", catalog="micimpact" )
// Define named queries here
@NamedQueries ( {
  @NamedQuery ( name="LocalesEntity.countAll", query="SELECT COUNT(x) FROM LocalesEntity x" )
} )
public class LocalesEntity implements Serializable {

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
    @Column(name="language", nullable=false, length=255)
    private String     language     ;

    @Column(name="value", length=255)
    private String     value        ;



    //----------------------------------------------------------------------
    // ENTITY LINKS ( RELATIONSHIP )
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------
    // CONSTRUCTOR(S)
    //----------------------------------------------------------------------
    public LocalesEntity() {
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
    //--- DATABASE MAPPING : language ( VARCHAR ) 
    public void setLanguage( String language ) {
        this.language = language;
    }
    public String getLanguage() {
        return this.language;
    }

    //--- DATABASE MAPPING : value ( VARCHAR ) 
    public void setValue( String value ) {
        this.value = value;
    }
    public String getValue() {
        return this.value;
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
        sb.append(language);
        sb.append("|");
        sb.append(value);
        return sb.toString(); 
    } 

}

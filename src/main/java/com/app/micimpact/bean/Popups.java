/*
 * Created on 20 5�� 2015 ( Time 17:26:44 )
 * Generated by Telosys Tools Generator ( version 2.1.0 )
 */
package com.app.micimpact.bean;

import java.io.Serializable;

import javax.validation.constraints.*;

import java.util.Date;

public class Popups implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @NotNull
    private Integer id;

    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    
    @Size( max = 64 )
    private String name;

    @Size( max = 255 )
    private String locale;


    private Date startAt;


    private Date endAt;

    @Size( max = 128 )
    private String imageUrl;



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
    public void setName( String name ) {
        this.name = name;
    }
    public String getName() {
        return this.name;
    }

    public void setLocale( String locale ) {
        this.locale = locale;
    }
    public String getLocale() {
        return this.locale;
    }

    public void setStartAt( Date startAt ) {
        this.startAt = startAt;
    }
    public Date getStartAt() {
        return this.startAt;
    }

    public void setEndAt( Date endAt ) {
        this.endAt = endAt;
    }
    public Date getEndAt() {
        return this.endAt;
    }

    public void setImageUrl( String imageUrl ) {
        this.imageUrl = imageUrl;
    }
    public String getImageUrl() {
        return this.imageUrl;
    }


    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
 
        public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append(id);
        sb.append("|");
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

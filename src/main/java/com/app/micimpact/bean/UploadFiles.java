
package com.app.micimpact.bean;

import java.io.Serializable;

import javax.validation.constraints.*;


public class UploadFiles implements Serializable {

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
    @Size( min = 1, max = 512 )
    private String path;

    private Integer ownerId;

    @Size( max = 255 )
    private String extra1;

    @Size( max = 255 )
    private String extra2;

    @Size( max = 128 )
    private String domain;



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
    public void setPath( String path ) {
        this.path = path;
    }
    public String getPath() {
        return this.path;
    }

    public void setOwnerId( Integer ownerId ) {
        this.ownerId = ownerId;
    }
    public Integer getOwnerId() {
        return this.ownerId;
    }

    public void setExtra1( String extra1 ) {
        this.extra1 = extra1;
    }
    public String getExtra1() {
        return this.extra1;
    }

    public void setExtra2( String extra2 ) {
        this.extra2 = extra2;
    }
    public String getExtra2() {
        return this.extra2;
    }

    public void setDomain( String domain ) {
        this.domain = domain;
    }
    public String getDomain() {
        return this.domain;
    }


    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
 
        public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append(id);
        sb.append("|");
        sb.append(path);
        sb.append("|");
        sb.append(ownerId);
        sb.append("|");
        sb.append(extra1);
        sb.append("|");
        sb.append(extra2);
        sb.append("|");
        sb.append(domain);
        return sb.toString(); 
    } 


}

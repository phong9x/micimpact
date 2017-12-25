
package com.app.micimpact.bean.jpa;

import java.io.Serializable;

//import javax.validation.constraints.* ;
//import org.hibernate.validator.constraints.* ;


import javax.persistence.*;

/**
 * Persistent class for entity stored in table "upload_files"
 *
 * @author Telosys Tools Generator
 *
 */

@Entity
@Table(name="upload_files", catalog="micimpact" )
// Define named queries here
@NamedQueries ( {
  @NamedQuery ( name="UploadFilesEntity.countAll", query="SELECT COUNT(x) FROM UploadFilesEntity x" )
} )
public class UploadFilesEntity implements Serializable {

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
    @Column(name="path", nullable=false, length=512)
    private String     path         ;

    @Column(name="owner_id")
    private Integer    ownerId      ;

    @Column(name="extra1", length=255)
    private String     extra1       ;

    @Column(name="extra2", length=255)
    private String     extra2       ;

    @Column(name="domain", length=128)
    private String     domain       ;



    //----------------------------------------------------------------------
    // ENTITY LINKS ( RELATIONSHIP )
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------
    // CONSTRUCTOR(S)
    //----------------------------------------------------------------------
    public UploadFilesEntity() {
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
    //--- DATABASE MAPPING : path ( VARCHAR ) 
    public void setPath( String path ) {
        this.path = path;
    }
    public String getPath() {
        return this.path;
    }

    //--- DATABASE MAPPING : owner_id ( INT ) 
    public void setOwnerId( Integer ownerId ) {
        this.ownerId = ownerId;
    }
    public Integer getOwnerId() {
        return this.ownerId;
    }

    //--- DATABASE MAPPING : extra1 ( VARCHAR ) 
    public void setExtra1( String extra1 ) {
        this.extra1 = extra1;
    }
    public String getExtra1() {
        return this.extra1;
    }

    //--- DATABASE MAPPING : extra2 ( VARCHAR ) 
    public void setExtra2( String extra2 ) {
        this.extra2 = extra2;
    }
    public String getExtra2() {
        return this.extra2;
    }

    //--- DATABASE MAPPING : domain ( VARCHAR ) 
    public void setDomain( String domain ) {
        this.domain = domain;
    }
    public String getDomain() {
        return this.domain;
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

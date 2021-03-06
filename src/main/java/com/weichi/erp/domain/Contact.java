package com.weichi.erp.domain;

public class Contact extends SuperDomain {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column contact.qq
     *
     * @mbggenerated Wed Aug 01 10:58:57 CST 2018
     */
    private String qq;
    private String qqDescp;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column contact.email
     *
     * @mbggenerated Wed Aug 01 10:58:57 CST 2018
     */
    private String email;
    private String emailDescp;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column contact.city
     *
     * @mbggenerated Wed Aug 01 10:58:57 CST 2018
     */
    private String city;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column contact.detail_address
     *
     * @mbggenerated Wed Aug 01 10:58:57 CST 2018
     */
    private String detailAddress;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column contact.gps_address
     *
     * @mbggenerated Wed Aug 01 10:58:57 CST 2018
     */
    private String gpsAddress;

    public String getQqDescp() {
        return qqDescp;
    }

    public void setQqDescp(String qqDescp) {
        this.qqDescp = qqDescp;
    }

    public String getEmailDescp() {
        return emailDescp;
    }

    public void setEmailDescp(String emailDescp) {
        this.emailDescp = emailDescp;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column contact.qq
     *
     * @return the value of contact.qq
     * @mbggenerated Wed Aug 01 10:58:57 CST 2018
     */
    public String getQq() {
        return qq;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column contact.qq
     *
     * @param qq the value for contact.qq
     * @mbggenerated Wed Aug 01 10:58:57 CST 2018
     */
    public void setQq(String qq) {
        this.qq = qq;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column contact.email
     *
     * @return the value of contact.email
     * @mbggenerated Wed Aug 01 10:58:57 CST 2018
     */
    public String getEmail() {
        return email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column contact.email
     *
     * @param email the value for contact.email
     * @mbggenerated Wed Aug 01 10:58:57 CST 2018
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column contact.city
     *
     * @return the value of contact.city
     * @mbggenerated Wed Aug 01 10:58:57 CST 2018
     */
    public String getCity() {
        return city;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column contact.city
     *
     * @param city the value for contact.city
     * @mbggenerated Wed Aug 01 10:58:57 CST 2018
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column contact.detail_address
     *
     * @return the value of contact.detail_address
     * @mbggenerated Wed Aug 01 10:58:57 CST 2018
     */
    public String getDetailAddress() {
        return detailAddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column contact.detail_address
     *
     * @param detailAddress the value for contact.detail_address
     * @mbggenerated Wed Aug 01 10:58:57 CST 2018
     */
    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column contact.gps_address
     *
     * @return the value of contact.gps_address
     * @mbggenerated Wed Aug 01 10:58:57 CST 2018
     */
    public String getGpsAddress() {
        return gpsAddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column contact.gps_address
     *
     * @param gpsAddress the value for contact.gps_address
     * @mbggenerated Wed Aug 01 10:58:57 CST 2018
     */
    public void setGpsAddress(String gpsAddress) {
        this.gpsAddress = gpsAddress;
    }
}
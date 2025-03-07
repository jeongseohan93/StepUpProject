package vo;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class AcademyVO {
    private int academy_idx;
    private float academy_rating;
    private String academy_id, academy_pwd, academy_name, academy_phone, academy_content, academy_bus_num, academy_address, academy_latitude,
            academy_longitude, academy_category, academy_sub, academy_region, academy_email, academy_profile;
    private MultipartFile academy_pic;



	public String getAcademy_profile() {

        return academy_profile;
    }

    public void setAcademy_profile(String academy_profile) {

        this.academy_profile = academy_profile;
    }

	public MultipartFile getAcademy_pic() {
        return academy_pic;
    }

    public void setAcademy_pic(MultipartFile academy_pic) {
        this.academy_pic = academy_pic;
    }

    public int getAcademy_idx() {

        return academy_idx;
    }

    public void setAcademy_idx(int academy_idx) {

        this.academy_idx = academy_idx;
    }

    public float getAcademy_rating() {

        return academy_rating;
    }

    public void setAcademy_rating(float academy_rating) {

        this.academy_rating = academy_rating;
    }

    public String getAcademy_id() {

        return academy_id;
    }

    public void setAcademy_id(String academy_id) {

        this.academy_id = academy_id;
    }

    public String getAcademy_pwd() {

        return academy_pwd;
    }

    public void setAcademy_pwd(String academy_pwd) {

        this.academy_pwd = academy_pwd;
    }

    public String getAcademy_name() {

        return academy_name;
    }

    public void setAcademy_name(String academy_name) {

        this.academy_name = academy_name;
    }

    public String getAcademy_phone() {

        return academy_phone;
    }

    public void setAcademy_phone(String academy_phone) {
        this.academy_phone = academy_phone;
    }

    public String getAcademy_content() {
        return academy_content;
    }

    public void setAcademy_content(String academy_content) {
        this.academy_content = academy_content;
    }

    public String getAcademy_bus_num() {
        return academy_bus_num;
    }

    public void setAcademy_bus_num(String academy_bus_num) {
        this.academy_bus_num = academy_bus_num;
    }

    public String getAcademy_address() {
        return academy_address;
    }

    public void setAcademy_address(String academy_address) {
        this.academy_address = academy_address;
    }

    public String getAcademy_latitude() {
        return academy_latitude;
    }

    public void setAcademy_latitude(String academy_latitude) {
        this.academy_latitude = academy_latitude;
    }

    public String getAcademy_longitude() {
        return academy_longitude;
    }

    public void setAcademy_longitude(String academy_longitude) {
        this.academy_longitude = academy_longitude;
    }

    public String getAcademy_category() {
        return academy_category;
    }

    public void setAcademy_category(String academy_category) {
        this.academy_category = academy_category;
    }

    public String getAcademy_sub() {
        return academy_sub;
    }

    public void setAcademy_sub(String academy_sub) {
        this.academy_sub = academy_sub;
    }

    public String getAcademy_region() {
        return academy_region;
    }

    public void setAcademy_region(String academy_region) {
        this.academy_region = academy_region;
    }

    public String getAcademy_email() {
        return academy_email;
    }

    public void setAcademy_email(String academy_email) {
        this.academy_email = academy_email;
    }


}

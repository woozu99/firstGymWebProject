<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="./include/header.jsp" %>

    <div class="login-main-div">
        <div class="login-change-div">
            <ul>
                <li id="login-user-login-modifier" class="login-change-mode login-active">회원</li>
                <li id="login-nonuser-login-modifier" class="login-change-mode login-right-inactive">비회원</li>
            </ul>
        </div>
        <div class="login-input-div">
            <!-- 회원 로그인 -->
            <div id="login-user-login-input" class="login-active">
                <form action="#">
                    <input type="text" placeholder="아이디" name=""><br>
                    <input type="password" placeholder="비밀번호" name=""><br>
                    
                    <button type="submit" class="color-darkskyblue">로그인</button>
                </form>
            </div>
            <!-- 비회원 로그인 -->
            <div id="login-nonuser-login-input">
                <form action="#">
                    <input type="text" placeholder="이름" name=""><br>
                    <input type="text" placeholder="전화번호" name=""><br>
                    
                    <button type="submit" class="color-darkskyblue">로그인</button>
                </form>
            </div>
        </div>
        <div id="login-links-div">
            <a href="#" id="login-find-pw">비밀번호 찾기</a> | <a href="#" id="login-find-id">아이디 찾기</a> | <a href="#" id="login-join">회원가입</a>
        </div>
    </div>
    <!-- 아이디, 비번 찾기 모달 -->
    <div id="login-modal">
        <div class="login-modal-div">
            <div class="login-modal-xbtn-div login-clearfix color-skyblue">
                <div id="login-modal-title" class="login-float-left">아이디 찾기</div>
                <button id="login-modal-xbtn" class="login-btn-red login-float-right">x</button>
            </div>
            <div class="login-modal-content">
                <!-- 아이디 찾기 -->
                <div id="login-id-modal">
                    <form action="#">            
                        <div class="login-modal-content-text">
                            이름 입력
                        </div>
                        <input type="text" name="" placeholder="이름">
                        <div class="login-modal-content-text">
                            이메일 입력
                        </div>
                        <div id="login-modal-id-numbermake-btn" class="login-clearfix">
                            <input type="text" name="" placeholder="이메일" class="login-float-left">
                            <button type="button" class="login-float-right login-color-white color-darkskyblue login-btn-small">인증번호 발송</button>
                        </div>
                    </form>
                </div>
                <!-- 비밀번호 찾기 -->
                <div id="login-pw-modal">
                    <form action="#">            
                        <div class="login-modal-content-text">
                            아이디 입력
                        </div>
                        <div id="login-modal-id-numbermake-btn" class="login-clearfix">
                            <input type="text" name="" placeholder="아이디" class="login-float-left">
                            <button type="button" class="login-float-right login-color-white color-darkskyblue login-btn-small">인증번호 발송</button>
                        </div>
                    </form>
                </div>
                <!-- 인증번호 맞는지 확인 -->
                <div id="login-make-number-modal">
                    <hr>
                    <form action="#">            
                        <div class="login-modal-content-text">
                            인증번호 입력
                        </div>
                        <div id="login-modal-id-numberckeck" class="login-clearfix">
                            <input type="text" name="" placeholder="인증번호" class="login-float-left">
                            <button type="button" id="login-numbercheck-btn" class="login-float-right login-color-white color-darkskyblue login-btn-small">인증번호 확인</button>
                        </div>
                    </form>
                </div>
                <!-- 결과 모달(비밀번호면 text부분을 js로 변경)) -->
                <div id="login-result-modal">
                    <div id="login-result-title" class="login-modal-content-text">
                        아이디
                    </div>
                    <div id="login-check-result">
                        abc1234
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 푸터. jsp전환시 삭제 후 include 사용 -->
    <%@ include file="./include/footer.jsp" %>
<script>
    // 회원로그인, 비회원 로그인 전환
    const $user_login_modifier = $('#login-user-login-modifier');
    const $nonuser_login_modifier = $('#login-nonuser-login-modifier');
    const $user_login_input = $('#login-user-login-input');
    const $nonuser_login_input = $('#login-nonuser-login-input');
    
    $user_login_modifier.click(function(){
        if(! $user_login_modifier.hasClass('login-active')){
            $user_login_modifier.toggleClass('login-active');
            $nonuser_login_modifier.toggleClass('login-active');
            $user_login_modifier.toggleClass('login-left-inactive');
            $nonuser_login_modifier.toggleClass('login-right-inactive');
            $user_login_input.toggleClass('login-active');
            $nonuser_login_input.toggleClass('login-active')
        }
    });

    $nonuser_login_modifier.click(function(){
        if(! $nonuser_login_modifier.hasClass('login-active')){
            $user_login_modifier.toggleClass('login-active');
            $nonuser_login_modifier.toggleClass('login-active');
            $user_login_modifier.toggleClass('login-left-inactive');
            $nonuser_login_modifier.toggleClass('login-right-inactive');
            $user_login_input.toggleClass('login-active');
            $nonuser_login_input.toggleClass('login-active')
        }
    });

    // 아이디, 비번 찾기 모달
    const $modal = $('#login-modal');
    const $find_pw_btn = $('#login-find-pw');
    const $find_id_btn = $('#login-find-id');
    const $modal_xbtn = $('#login-modal-xbtn');
    const $numbercheck_btn = $('#login-numbercheck-btn');
    const $id_modal = $('#login-id-modal');
    const $pw_modal = $('#login-pw-modal');
    const $make_number_modal = $('#login-make-number-modal');
    const $result_modal = $('#login-result-modal');

    $modal.hide();
    
    $find_pw_btn.click(function(){
        event.preventDefault();
        $('#login-modal-title').text('비밀번호 찾기');
        $('#login-result-title').text('비밀번호');

        $modal.show();
        $id_modal.hide();
        $pw_modal.show();
        $make_number_modal.show();
        $result_modal.hide();
    });

    $find_id_btn.click(function(){
        event.preventDefault();
        $('#login-modal-title').text('아이디 찾기');
        $('#login-result-title').text('아이디');
        $modal.show();
        $id_modal.show();
        $pw_modal.hide();
        $make_number_modal.show();
        $result_modal.hide();
    });

    $modal_xbtn.click(function(){
        $modal.hide();
    });

    $numbercheck_btn.click(function(){
        
        $modal.show();
        $id_modal.hide();
        $pw_modal.hide();
        $make_number_modal.hide();
        $result_modal.show();
    });
</script>
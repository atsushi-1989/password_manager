#!/usr/bin/bash

echo "パスワードマネージャーへようこそ！"
echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
        read mode

while :
    do
    
         if [[ $mode = "Add Password" ]];then
            echo "サービス名を入力してください："
            read service_name
            echo "ユーザー名を入力してください："
            read user_name
            echo "パスワードを入力してください："
            read pass_word
            
            echo "$service_name : $user_name : $pass_word" >>password_box.txt
            
            echo "パスワードの追加は成功しました。"
            
            echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
            read mode
            
            
            
        elif [[ $mode = "Get Password" ]];then
            echo "サービス名を入力してください："
            read service_name
            
            
            service=$(grep ${service_name} password_box.txt | cut -d ':' -f 1)
            user=$(grep ${service_name} password_box.txt | cut -d ':' -f 2)
            pass=$(grep ${service_name} password_box.txt | cut -d ':' -f 3)
            
            if [[ $? = 0 ]]; then
                echo "サービス名：${service}"
                echo "ユーザー名：${user}"
                echo "パスワード：${pass}"
                
                echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
                read mode
                
            else
                echo "そのサービスは登録されていません。"
                echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
                read mode
            fi
            
        
        elif [[ $mode = "Exit" ]];then
                echo "Thank you!"
                break
        else
                echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
                read mode
            
        fi
    
    done
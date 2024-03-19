## 2. Training Q&As

### 2-1. Prepare JSON training data

1. Access [Botpress Accuracy Checker > Training Data Convertor](https://botpress-accuracy-checker.herokuapp.com/training-data/select).

![01_training_data_convertor.jpg](./imgs/build_and_deploy_botpress/01_training_data_convertor.jpg)

2. Click `Choose File` and choose a [CSV training data](../csv/training_data.csv).

![02_choose_csv_training_data.jpg](./imgs/build_and_deploy_botpress/02_choose_csv_training_data.jpg)

3. Click `Export JSON`.

![03_click_export_json.jpg](./imgs/build_and_deploy_botpress/03_click_export_json.jpg)

4. Download the [JSON training data](../json/training_data_20211129121638.json) on your local storage.

![04_download_json_training_data.jpg](./imgs/build_and_deploy_botpress/04_download_json_training_data.jpg)

### 2-2. Train Q&As in Botpress Server

1. Access your Botpress Server and login.

![05_login.jpg](./imgs/build_and_deploy_botpress/05_login.jpg)

2. On the top page, select `New Bot`.

![06_select_new_bot.jpg](./imgs/build_and_deploy_botpress/06_select_new_bot.jpg)

3. Name the bot as you like, select `Empty Bot` in 'Bot Template' section and click `Create Bot`.

![07_create_bot.jpg](./imgs/build_and_deploy_botpress/07_create_bot.jpg)

4. Again on the top page, choose the bot you have just created.

![08_choose_the_bot.jpg](./imgs/build_and_deploy_botpress/08_choose_the_bot.jpg)

5. Click 'Bottom Panel' icon and a gear icon, define your User ID and save it, and close the panel.

![09_define_user_id.jpg](./imgs/build_and_deploy_botpress/09_define_user_id.jpg)

6. In 'Config' section, set `Japanese` as the default language.

![10_set_default_language.jpg](./imgs/build_and_deploy_botpress/10_set_default_language.jpg)

7. In 'Q&A' section, click 'Import JSON' icon.

![11_click_import_json.jpg](./imgs/build_and_deploy_botpress/11_click_import_json.jpg)

8. Click `Browse`, choose the JSON training data you have just downloaded and click `next`.

![12_choose_json_training_data.jpg](./imgs/build_and_deploy_botpress/12_choose_json_training_data.jpg)
![13_click_next.jpg](./imgs/build_and_deploy_botpress/13_click_next.jpg)

9. Choose an item of 2 radio buttons according to your need and click `Submit`.

![14_submit_training_data.jpg](./imgs/build_and_deploy_botpress/14_submit_training_data.jpg)

10. After upload is done, 'Upload Successfully' message appears. Then click `Train Chatbot`.

![15_train_chatbot.jpg](./imgs/build_and_deploy_botpress/15_train_chatbot.jpg)

11. Check if the chatbot properly responses to your question in Emulator.

![16_emulate_response.jpg](./imgs/build_and_deploy_botpress/16_emulate_response.jpg)

12. Go to the top page, open the inspector and get a Bearer token on 'Network' section.

![17_get_bearer_token.jpg](./imgs/build_and_deploy_botpress/17_get_bearer_token.jpg)

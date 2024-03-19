## 2. Training Q&As

### 2-1. Prepare JSON training data

Run the following command to convert a [CSV training data](../csv/training_data.csv) to a [JSON training data](../json/training_data_20211130221016.json).

```bash
$ python exec_training_data.rb
```

### 2-2. Train Q&As in Botpress Server

1. Access your Botpress Server and login.

![01_login.jpg](./imgs/01_login.jpg)

2. On the top page, select `New Bot`.

![02_select_new_bot.jpg](./imgs/02_select_new_bot.jpg)

3. Name the bot as you like, select `Empty Bot` in 'Bot Template' section and click `Create Bot`.

![03_create_bot.jpg](./imgs/03_create_bot.jpg)

4. Again on the top page, choose the bot you have just created.

![04_choose_the_bot.jpg](./imgs/04_choose_the_bot.jpg)

5. Click 'Bottom Panel' icon and a gear icon, define your User ID and save it, and close the panel.

![05_define_user_id.jpg](./imgs/05_define_user_id.jpg)

6. In 'Config' section, set `Japanese` as the default language.

![06_set_default_language.jpg](./imgs/06_set_default_language.jpg)

7. In 'Q&A' section, click 'Import JSON' icon.

![07_click_import_json.jpg](./imgs/07_click_import_json.jpg)

8. Click `Browse`, choose the JSON training data you have just downloaded and click `next`.

![08_choose_json_training_data.jpg](./imgs/08_choose_json_training_data.jpg)
![09_click_next.jpg](./imgs/09_click_next.jpg)

9. Choose an item of 2 radio buttons according to your need and click `Submit`.

![10_submit_training_data.jpg](./imgs/10_submit_training_data.jpg)

10. After upload is done, 'Upload Successfully' message appears. Then click `Train Chatbot`.

![11_train_chatbot.jpg](./imgs/11_train_chatbot.jpg)

11. Check if the chatbot properly responses to your question in Emulator.

![12_emulate_response.jpg](./imgs/12_emulate_response.jpg)

12. Go to the top page, open the inspector and get a Bearer token on 'Network' section.

![13_get_bearer_token.jpg](./imgs/13_get_bearer_token.jpg)

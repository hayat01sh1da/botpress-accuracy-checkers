## Endpoints

|Prefix |Verb |URI Pattern |Controller#Action |
|:-|:-|:-|:-|
|root |GET |/ |top#index |
|top |GET |/top(.:format) |top#index |
|new_training_data |GET |/training_data/new(.:format) |training_data#new |
|training_data_download |POST |/training_data/download(.:format) |training_data#download |
| |GET |/training_data/download(.:format) |redirect(301, /training_data/new) |
|new_score_chart |GET |/score_chart/new(.:format) |score_chart#new |
|score_chart |POST |/score_chart(.:format) |score_chart#create |
|score_chart_draw |GET |/score_chart/draw(.:format) |score_chart#draw |
|score_chart_download |GET |/score_chart/download(.:format) |score_chart#download {:default=>{:format=>:csv}} |
| |GET |/score_chart(.:format) |redirect(301, /score_chart/new) |

-- 코드를 입력하세요
SELECT '/home/grep/src/'||board_id||'/'||file_id||file_name||file_ext as FILE_PATH
from (select FILE_ID, FILE_EXT, FILE_NAME, b.BOARD_ID
      from USED_GOODS_BOARD b inner join USED_GOODS_FILE f on b.board_id = f.board_id
      where views = (select max(VIEWS) from USED_GOODS_BOARD ) )
order by file_id desc
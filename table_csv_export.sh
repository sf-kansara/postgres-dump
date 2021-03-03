POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

#Var parsing logic: https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
case $key in
  -h)
  DB_HOST="$2"
  shift # past argument
  shift # past value
  ;;
  -p)
  DB_PORT="$2"
  shift # past argument
  shift # past value
  ;;
  -U)
  DB_USERNAME="$2"
  shift # past argument
  shift # past value
  ;;
  -d)
  DB_DATABASE="$2"
  shift # past argument
  shift # past value
  ;;
  --schema)
  DB_SCHEMA="$2"
  shift # past argument
  shift # past value
  ;;
  --table-names)
  TABLE_NAMES="$2"
  shift # past argument
  shift # past value
  ;;
  *)    # unknown option
  POSITIONAL+=("$1") # save it in an array for later
  shift # past argument
  ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

START_TS=$(date +"%Y%m%d-%H:%M:%S")
DUMP_FOLDER="table-csv-dump-${START_TS}"

mkdir -p $DUMP_FOLDER

for i in $(echo $TABLE_NAMES | sed "s/,/ /g")
do
  echo
  echo "Creating .csv dump for ${i}"
  OP_STR="psql -h ${DB_HOST} -p ${DB_PORT} -U ${DB_USERNAME} -d ${DB_DATABASE} -c \"\COPY ${DB_SCHEMA}.${i} TO '${DUMP_FOLDER}/${i}.csv' WITH (FORMAT CSV, HEADER);\""
  (eval $OP_STR && echo ".csv dump successful for ${i}") || echo ".csv dump failure for ${i}"
done

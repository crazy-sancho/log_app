'use strict';

$(document).ready( function () {

    const today_date = moment().format('DD.MM.YYYY');
    const container = $('#pagination');
    let theData, copyData, removeData, i, j, theList;

    // disable submit if both inputs empty
    let taskInput = $('.task-input');
    let submitInput = $('#submit');
    taskInput.keyup(function() {

        let empty = false;
        taskInput.each(function() {
            if ($(this).val().length === 0) {
                empty = true;
            }
        });

        if (empty === false) {
            submitInput.removeAttr('disabled');
        } else {
            submitInput.attr('disabled', 'disabled');
        }

    });

    // CREATE TABLE

    $.getJSON( '../table.php', function(data){

        copyData = data.slice();

        function addRow() {
            $('#add-post').on('submit', function(e) {

                e.preventDefault();
                $.ajax({
                    type: 'POST',
                    url: '../form.php',
                    data: $(this).serialize(),
                    success: function (addData) {

                        for (i = 0; i < addData.length; i++) {

                            let date_dmy = moment(addData[i].task_date).format('DD.MM.YYYY');
                            let date_hm = moment(addData[i].task_date).format('HH:mm');
                            addData[i].date_dmy = date_dmy;
                            addData[i].date_hm = date_hm;
                            // add new entry to the beginning of an array
                            copyData.unshift(addData[i]);
                        }

                        // send new entry to array as new array
                        data = copyData;
                        callPagination();

                    }

                });

            });
        }

        function removeRow() {
            $('.remove-btn').on('click', function(e) {

                e.preventDefault();

                const task_id = $(this).attr('id');
                $.ajax({
                    type:'POST',
                    url:'./remove.php',
                    data: {id: task_id},
                    success: function(){

                        removeData = data.filter(function(obj) {
                            return obj.id !== task_id;
                        });
                        data = removeData;
                        callPagination();

                    }

                });

            });
        }

        function callPagination() {

            container.pagination({

                dataSource: data,
                pageSize: 5,
                callback: function (data, pagination) {

                    for (i = 0; i < data.length; i++) {

                        // add formatted date
                        let date_dmy = moment(data[i].task_date).format('DD.MM.YYYY');
                        let date_hm = moment(data[i].task_date).format('HH:mm');
                        data[i].date_dmy = date_dmy;
                        data[i].date_hm = date_hm;

                    }

                    // group by task creation date
                    theData = _.chain(data)
                        .groupBy("date_dmy")
                        .toPairs()
                        .map(function (currentItem) {
                            return _.zipObject(['task_date', 'task_array'], currentItem);
                        })
                        .value();

                    // today's date as 'Today'
                    if (theData[0].task_date === today_date) {
                        theData[0].task_date = 'Today'
                    }

                    // insert table into html
                    theList = '';
                    for (i = 0; i < theData.length; i++) {

                        theList += '<div>';
                        theList += '<h2>' + theData[i].task_date + '</h2>';
                        theList += '<table>';
                        theList += '<thead>';
                        theList += '<tr>';
                        theList += '<th> Description </th>';
                        theList += '<th> Time spent </th>';
                        theList += '<th> Date </th>';
                        theList += '<th>&nbsp;</th>';
                        theList += '</tr>';
                        theList += '</thead>';
                        theList += '<tbody>';

                        for (j = 0; j < theData[i].task_array.length; j++) {

                            theList += '<tr>';
                            theList += '<td>' + theData[i].task_array[j].task_name + '</td>';
                            theList += '<td>' + theData[i].task_array[j].task_time + '</td>';
                            theList += '<td>' + theData[i].task_array[j].date_dmy + ' ' + theData[i].task_array[j].date_hm + '</td>';
                            theList += '<td><span class="remove-btn" id="' + theData[i].task_array[j].id + '" ><i class="fa fa-times"></i></span></td>';
                            theList += '</tr>';

                        }

                        theList += '</tbody>';
                        theList += '</table>';
                        theList += '</div>';

                    }

                    //console.log(pagination);
                    container.prev().html(theList);

                }
            })
        }

        callPagination();
        addRow();
        removeRow();

    })
});
# for i in (seq 0 10 50)
#     # echo $i | dialog --guage "Working..." 10 35
#     clear
#     echo -n "STAGE $i" | termgraph --title "Workflow Stage"
#     sleep 0.5s
#     # echo -e "\b\b\b\b\b\b\b\b\b\b"
# end

for (i, index) in (seq 5)
    echo $index $i
end
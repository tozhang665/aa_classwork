export const RECEIVE_BENCHES = "RECEIVE_BENCHES"
import { fetchBenches } from "../util/bench_api_util"

export const receiveBenches = (benches) =>{
  return({
    type: RECEIVE_BENCHES,
    benches
  })
}


export const fetchBenchesUtil = () => dispatch =>(
  fetchBenches().then(data => dispatch(receiveBenches(data)))
)


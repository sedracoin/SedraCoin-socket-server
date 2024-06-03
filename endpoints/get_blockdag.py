# encoding: utf-8

from server import sedrad_client


async def get_blockdag():
    """
    Get some global Sedra BlockDAG information
    """
    resp = await sedrad_client.request("getBlockDagInfoRequest")
    return resp["getBlockDagInfoResponse"]
